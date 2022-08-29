Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761BBECAAA2
	for <ath11k@archiver.kernel.org>; Mon, 29 Aug 2022 05:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gzZfDFxypxRmW2dS/QV0qNRoZ/ehVcb29j2WmWmv9Uk=; b=pQqQ80sHkkhijM
	HCAgMbnqeEjRQ2bs/lF1dHCi8fiGM0KSPm3U03AK7DR/8WlrcjrgZ8/czUksx90GV5NrQd/vwSk7R
	fuz6b+WhqfcEc2uVjJ5+EIC7XlHCBAOmivGxX5gUWIQoxcrtitbUiAdsvdlOiwvLbU2htqi0wyvP4
	gNDBc2ceoMXI209U73XQjVqExbkamqG2rvW4DJxr+YXaDlvnJSpLnP7QNkf2aInX7rIFk+ZmjtCZ7
	kAVDcfVkmiYhVf1rW08ldvoZJmdFG5HxoGbgBLkBMhgxipiis5H6zq/Pl6Hxh9xqifKCuyC8MtIC5
	eW94x0BAYdSxZSsY0NkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSXLw-004tJA-N6; Mon, 29 Aug 2022 05:30:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSXLt-004tH1-ER
	for ath11k@lists.infradead.org; Mon, 29 Aug 2022 05:30:26 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27T47rYN014243;
	Mon, 29 Aug 2022 05:30:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=7JAuPFUgJ5bVpdlxV7UK5EHXLqVkEtstMPi2lQF8dNw=;
 b=ljcwAQoyFYhCGVQzDjErHd7jqU0le2nKeDTe1x1onONYrJQLDT9SQNxHooz8KpXjq1JO
 SofLRydhI40ySHXXxzptco8Bw+QxZX9+6HP5yvcTpf++UjR90FI+QaSmyCQVXN3N3a4X
 EWbzU1xdw6ROJb6bRTwBMtQW8DANzMtqG/moLORR/Oa6DG7xYhRrx2es4CuLDZpwmqFX
 PeiK6fDNjOaNw/OLkxtq2AXip54vBvbgWmfu9hE730uohA5iIXhMej+SHVxo63v53aON
 tmUiynUa4c1gBLBEVLdHYyEacL87eUR4zBS8VnNsjzHG9WWDMlQlaFDR1jHrHB4w5J7j Bg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j7c1qkgy4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Aug 2022 05:30:21 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27T5UK9e025498
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Aug 2022 05:30:20 GMT
Received: from [10.204.117.202] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Sun, 28 Aug
 2022 22:30:18 -0700
Message-ID: <7df6efae-0797-a27a-1372-db7ad16e71d2@quicinc.com>
Date: Mon, 29 Aug 2022 11:00:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 0/4] ath11k: Enable low power mode when WLAN is not active
Content-Language: en-US
To: Mark Herbert <mark.herbert42@gmail.com>,
        "Limonciello, Mario"
	<mario.limonciello@amd.com>,
        <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20220720134959.15688-1-quic_mpubbise@quicinc.com>
 <ad99d238-dc1a-3233-fc6b-0cd49e428903@amd.com>
 <6daefd60-dcbc-06e1-8091-ea225690edf8@amd.com>
 <ecce8764-1760-4617-49aa-c111305ebd55@quicinc.com>
 <7e00cc36-3a07-92e2-c60e-a3c8939b407e@amd.com>
 <ccdb8f94-0879-2c06-5b48-25c2340d1659@gmail.com>
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
In-Reply-To: <ccdb8f94-0879-2c06-5b48-25c2340d1659@gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ilf-BaQcp12EFdJP853Jmz0QcLHuyjMu
X-Proofpoint-GUID: ilf-BaQcp12EFdJP853Jmz0QcLHuyjMu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-29_02,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 phishscore=0 mlxscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1011 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=913 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208290026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220828_223025_507181_4AA2AF77 
X-CRM114-Status: GOOD (  11.63  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

T24gOC8yNi8yMDIyIDI6MzEgQU0sIE1hcmsgSGVyYmVydCB3cm90ZToKPj4KPj4+IFRoZSBjaGFu
Z2VzIHRoYXQgSSBoYXZlIHBvc3RlZCB3aWxsIG5vdCB3b3JrIG9uIG90aGVyIHRhcmdldHMgbGlr
ZSAKPj4+IFdDTjY4NTUgYXMgaXMuIEl0IHJlcXVpcmVzIGFkZGl0aW9uYWwgY2hhbmdlcyBhbmQg
dGhlcmVmb3JlIGxvdHMgb2YgCj4+PiB0ZXN0aW5nLgo+Pgo+IAo+IFdpbGwgdGhlIGNoYW5nZXMg
YmUgcG9zc2libGUgZm9yIFFDQTYzOTAgYXMgd2VsbD/CoCBDdXJyZW50bHkgdGhpcyBjaGlwIAo+
IG9ubHkgYWN0aXZhdGVzIHBvd2VyIHNhdmluZyBtb2RlIHdoZW4gaXQgaXMgY29ubmVjdGVkLCBi
dXQgYmVoYXZlcyBiYWRseSAKPiB3aGVuIG5vdCBhc3NvY2lhdGVkIHRvIGFueSBuZXR3b3JrLiBT
byB0aGVyZSBpcyBhIGNoYW5jZSB0aGF0IHRoaXMga2luZCAKPiBvZiBzb2x1dGlvbiB3aWxsIGhl
bHAuCj4gCgpOb3QgYXNzb2NpYXRlZCB0byBhbnkgbmV0d29yayBhcyBpbiBXaS1GaSBpcyBPTiBh
bmQgbm90IGNvbm5lY3RlZCBvciAKV2ktRmkgaXMgb2ZmPwoKTWFuaWthbnRhCgotLSAKYXRoMTFr
IG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
