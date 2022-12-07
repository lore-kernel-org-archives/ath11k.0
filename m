Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B39ACC47089
	for <ath11k@archiver.kernel.org>; Wed,  7 Dec 2022 06:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PPSEKzP37v+ZELebq8Q4WEj7AdKZGZrPdLlwC6jMH6o=; b=BlDnNZpUeWmpVa
	aJZjHfzpmxyh8nfgy+pvekV1As4woCyMRqk/Yi32BpvQhmrEJAu94qfj8cL6yrvqiuFukdLnK8Cd9
	A2wq4rwS2pu6hWUOb53fDlRxZXMGDMFI90TS5AluqrvC4ryvWlWwFQKS5g5z+peMo7hXngktO4dKb
	mVTyP0HzAqjJWjAaK7y5ZNRb8pv3bYAeN1SLIoXPdE/z7d8DgaP0xqJk1SKFIWiG01eYgy73wdUW3
	nGS9D79Arq0esG7tiyvMsQKtbZFokpvy5VsrZQ8eF0cy6TAmaSVc3rThJR3JHr6eHps8Yu8Aybb/r
	YA7UX37sqaWfRdA6s4KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2nxJ-00CuTb-7t; Wed, 07 Dec 2022 06:30:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2nxG-00CuSq-CU
	for ath11k@lists.infradead.org; Wed, 07 Dec 2022 06:30:55 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B76Sx8O006248;
	Wed, 7 Dec 2022 06:30:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=iqbD+cQtd1UGaRJXi190+6NCgeDp6/5xq40RNlyCweI=;
 b=K9IBarCF9P4t774oF+zm/v1P2QQFR8xqTT9HeMrCn77LyYixkv4ZGPVEM8WhoCbcUfyH
 WNIp60Dhn3D+j4/jWJFjgMCUNhQzBy6H3uojh2NGfRTwSs3nk5wSRxknv/FpmlEPYh5A
 QUjAoXgSzPTUPNS+073jy0+CS9S329lt64u6CLp9y+EKbXd6jOmlwe4Sc/EUNoPf0UAE
 q0ytxG4Np1JiuCzwcdrQP0hEYrMbYyiqmPVlP6LO/fOE4x1yz742KjCI5dbOQzlf3gKL
 Uc+V96ipoFg7c5r/s/bNdQ56v7YVt6F2WlDJKFEFrAyqniPIcoocHSDPGIxz8PhHGY27 vQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3majt4878n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Dec 2022 06:30:50 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2B76UnmD004268
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 Dec 2022 06:30:49 GMT
Received: from [10.231.195.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 6 Dec 2022
 22:30:47 -0800
Message-ID: <a918d3ee-edc7-b6a2-d15a-e0d77f0683e2@quicinc.com>
Date: Wed, 7 Dec 2022 14:30:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH 4/5] mac80211: run late dequeue late tx handlers without
 holding fq->lock
Content-Language: en-US
From: Wen Gong <quic_wgong@quicinc.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: <johannes@sipsolutions.net>, <ath11k@lists.infradead.org>,
        <johannes.berg@intel.com>
References: <20190316170634.13125-1-nbd@nbd.name>
 <20190316170634.13125-4-nbd@nbd.name>
 <9bce39db-1de4-f129-8d2f-77f51a64a5db@quicinc.com>
In-Reply-To: <9bce39db-1de4-f129-8d2f-77f51a64a5db@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QxurZ4iFmhiJHlSblpQWCJGRvEzziWge
X-Proofpoint-ORIG-GUID: QxurZ4iFmhiJHlSblpQWCJGRvEzziWge
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-07_02,2022-12-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 clxscore=1011 adultscore=0 mlxscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212070050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_223054_451267_B779D48E 
X-CRM114-Status: GOOD (  16.32  )
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

SGkgSm9oYW5uZXMsCgpkbyB5b3Uga25vdyBpdD8KCk9uIDEyLzUvMjAyMiA1OjQ2IFBNLCBXZW4g
R29uZyB3cm90ZToKPiBPbiAzLzE3LzIwMTkgMTowNiBBTSwgRmVsaXggRmlldGthdSB3cm90ZToK
Pj4gUmVkdWNlcyBsb2NrIGNvbnRlbnRpb24gb24gZW5xdWV1ZS9kZXF1ZXVlIG9mIGlUWFEgcGFj
a2V0cwo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBGZWxpeCBGaWV0a2F1IDxuYmRAbmJkLm5hbWU+Cj4+
IC0tLQo+PiDCoCBuZXQvbWFjODAyMTEvdHguYyB8IDEwICsrKysrKysrLS0KPj4gwqAgMSBmaWxl
IGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdp
dCBhL25ldC9tYWM4MDIxMS90eC5jIGIvbmV0L21hYzgwMjExL3R4LmMKPj4gaW5kZXggODEyN2U0
M2UxMmIxLi5mODUzNDRjOWFmNjIgMTAwNjQ0Cj4+IC0tLSBhL25ldC9tYWM4MDIxMS90eC5jCj4+
ICsrKyBiL25ldC9tYWM4MDIxMS90eC5jCj4+IEBAIC0zNTQ0LDYgKzM1NDQsNyBAQCBzdHJ1Y3Qg
c2tfYnVmZiAqaWVlZTgwMjExX3R4X2RlcXVldWUoc3RydWN0IAo+PiBpZWVlODAyMTFfaHcgKmh3
LAo+PiDCoMKgwqDCoMKgIGllZWU4MDIxMV90eF9yZXN1bHQgcjsKPj4gwqDCoMKgwqDCoCBzdHJ1
Y3QgaWVlZTgwMjExX3ZpZiAqdmlmID0gdHhxLT52aWY7Cj4+IMKgICtiZWdpbjoKPj4gwqDCoMKg
wqDCoCBzcGluX2xvY2tfYmgoJmZxLT5sb2NrKTsKPiBNYXliZSB1c2UtYWZ0ZXItZnJlZSB3aWxs
IGhhcHBlbmVkPwo+Cj4gWW91IGNhbiBzZWUgaWVlZTgwMjExX3R4X2RlcXVldWUoKSBpbiB0eC5j
IGFzIGJlbG93LCBhZnRlciAKPiBpZWVlODAyMTFfZnJlZV90eHNrYigpLCBpdCB3aWxsIGdvdG8g
YmVnaW4sCj4gSWYgZ290byBvdXQgaGFwcGVuZWQgaW4gYmVsb3cgY2hlY2ssIHRoZW4gdGhlIHNr
YiB3aGljaCBpcyBmcmVlZCB3aWxsIAo+IGJlIHJldHVybmVkLCBhbmQgdXNlLWFmdGVyLWZyZWUg
d2lsbCBoYXBwZW4uCj4KPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2Vy
bmVsL2dpdC9rdmFsby9hdGguZ2l0L3RyZWUvbmV0L21hYzgwMjExL3R4LmM/aWQ9ZGVkNDY5OGI1
OGNiMjNjMjJiMGRjYmQ4MjljZWQxOWNlNGU2Y2UwMiNuMzUzOCAKPgo+IGJlZ2luOgo+IMKgwqAg
wqBzcGluX2xvY2tfYmgoJmZxLT5sb2NrKTsKPgo+IMKgwqAgwqBpZiAodGVzdF9iaXQoSUVFRTgw
MjExX1RYUV9TVE9QLCAmdHhxaS0+ZmxhZ3MpIHx8Cj4gwqDCoCDCoMKgwqDCoCB0ZXN0X2JpdChJ
RUVFODAyMTFfVFhRX1NUT1BfTkVUSUZfVFgsICZ0eHFpLT5mbGFncykpCj4gwqDCoCDCoMKgwqDC
oCBnb3RvIG91dDsKPgo+IMKgwqAgwqBpZiAodmlmLT50eHFzX3N0b3BwZWRbaWVlZTgwMjExX2Fj
X2Zyb21fdGlkKHR4cS0+dGlkKV0pIHsKPiDCoMKgIMKgwqDCoMKgIHNldF9iaXQoSUVFRTgwMjEx
X1RYUV9TVE9QX05FVElGX1RYLCAmdHhxaS0+ZmxhZ3MpOwo+IMKgwqAgwqDCoMKgwqAgZ290byBv
dXQ7Cj4gwqDCoCDCoH0KPgo+IMKgwqAgwqAvKiBNYWtlIHN1cmUgZnJhZ21lbnRzIHN0YXkgdG9n
ZXRoZXIuICovCj4gwqDCoCDCoHNrYiA9IF9fc2tiX2RlcXVldWUoJnR4cWktPmZyYWdzKTsKPiDC
oMKgIMKgaWYgKHNrYikKPiDCoMKgIMKgwqDCoMKgIGdvdG8gb3V0Owo+Cj4gwqDCoCDCoHNrYiA9
IGZxX3Rpbl9kZXF1ZXVlKGZxLCB0aW4sIGZxX3Rpbl9kZXF1ZXVlX2Z1bmMpOwo+IMKgwqAgwqBp
ZiAoIXNrYikKPiDCoMKgIMKgwqDCoMKgIGdvdG8gb3V0Owo+Cj4gwqDCoCDCoHNwaW5fdW5sb2Nr
X2JoKCZmcS0+bG9jayk7Cj4KPiBNYXliZSAic2tiID0gTlVMTDsiIHNob3VsZCBiZSBhZGRlZCBh
ZnRlciAiYmVnaW46Ii4KPgo+IC4uLgo+CgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2F0aDExawo=
