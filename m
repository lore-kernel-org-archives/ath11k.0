Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60FB4C6FA82
	for <ath11k@archiver.kernel.org>; Tue, 13 Sep 2022 04:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AKwDQfvfok844XLKUNZeIVx0YYMqn6Q+L2/1YZi65xo=; b=Hin0LW4CKcZHnn
	jXNq5QFL/8mWJkyHTNKs5ORI1Ti18ACOBFVNf06xdlwYWLQXvvczpuqy4vVstT9HTK/STUmQVtKmz
	2wwCUbAPjG9eSdrx6zSONcjXNFvKogQiubJIdZyh4fO1Sd+LEdAoFQCghBwsTsNNo16mnA5drIX4I
	NmkctEMa34DUpvcPLxCNbw9eg8mxxMEjp/4SCYpw5p9KlUCBY0NHueOWbMqJKnvLQ6a4qznQrF781
	v41O0gwrxBd6pMyAkB9A4wkUa71/xGuWglrozXbEDVivMBEJVRDPWU8cAnxc0900CuhaWA672MeRD
	K4P4gBj30pqrBCRW1QLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXxhU-001mbZ-3I; Tue, 13 Sep 2022 04:39:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXxYX-001dB5-8K
	for ath11k@lists.infradead.org; Tue, 13 Sep 2022 04:29:55 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28D4PndN031022;
	Tue, 13 Sep 2022 04:29:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=SX9tohww+nxgNIMznlpi1JktYrP5xrIWwBB7lfg10Yk=;
 b=VlBWbcTPTvmCRBHRReFogweu392ht2WGwU/A52z4lITq55L5us+x3GtvXlueeHa4lpeK
 u++Ky/fHGLSCHmsEMbS7kmAAoUpOGSC8m+voLVP9shEGHqSDt6W8AgK6yCk6RY4jFiJN
 IDTitOFN0V9/j7Bkwe/kg5i/XC58EAap9SAOiCI2W1veWGSsX2AJubrId2JWxsX52rqr
 u0LINbHQU7enlkq6tGFMIl5pp0ah26iAneQG30v2EIDsyNNEsWYVXU+fvEtF3+RvEMmt
 N3MhPY7AQDmuuHGvy0Y/jh8qadTR6MPn1TntnE6CYWKKzw2W6ra1j4qcBYruICpf+nEw JQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jgk636260-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 04:29:49 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28D4TmHX015828
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 04:29:48 GMT
Received: from [10.231.195.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 12 Sep
 2022 21:29:46 -0700
Message-ID: <c28b9240-c45e-c8cd-ece7-d967da93896c@quicinc.com>
Date: Tue, 13 Sep 2022 12:29:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] wifi: mac80211: RCU-ify link STA pointers
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: Johannes Berg <johannes@sipsolutions.net>,
        linux-wireless
	<linux-wireless@vger.kernel.org>,
        <ath11k@lists.infradead.org>
References: <24df3a0c-a312-d9b6-5840-1eacd79d824b@quicinc.com>
 <87a67498b4.fsf@kernel.org>
 <7199bd7d-b45c-5c72-576e-363ad37cce82@quicinc.com>
 <875yhs97kg.fsf@kernel.org>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <875yhs97kg.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NnH5cWp-FXLO9qYOsgjJx_YDrsS9OSEf
X-Proofpoint-ORIG-GUID: NnH5cWp-FXLO9qYOsgjJx_YDrsS9OSEf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-13_01,2022-09-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 adultscore=0 phishscore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2209130019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220912_212953_456905_870A9D98 
X-CRM114-Status: GOOD (  14.43  )
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

UGxlYXNlIGlnbm9yZSB0aGlzIG1haWwgd2hpY2ggaXMgbm90IHJlYWxseSBmb3IgcGF0Y2ggcmV2
aWV3LgoKT24gOS8xMi8yMDIyIDc6MDUgUE0sIEthbGxlIFZhbG8gd3JvdGU6Cj4gV2VuIEdvbmcg
PHF1aWNfd2dvbmdAcXVpY2luYy5jb20+IHdyaXRlczoKPgo+PiBPbiA5LzEyLzIwMjIgNjo0OSBQ
TSwgS2FsbGUgVmFsbyB3cm90ZToKPj4+IFdlbiBHb25nIDxxdWljX3dnb25nQHF1aWNpbmMuY29t
PiB3cml0ZXM6Cj4+Pgo+Pj4+IEhpIEpvaGFubmVzLAo+Pj4+Cj4+Pj4gQ3VycmVudGx5IGZvciBN
TE8gdGVzdCwgdGhlIG90aGVycyBsaW5rcydzIHJ4X25zcyBvZiBzdHJ1Y3QKPj4+PiBpZWVlODAy
MTFfbGlua19zdGEgaXMgc3RpbGwgdmFsdWUgMCBpbiBpZWVlODAyMTFfc2V0X2Fzc29jaWF0ZWQo
KSwKPj4+PiBiZWNhdWUgdGhleSBhcmUgbm90IHBhc3MgaW50byBpZWVlODAyMTFfc3RhX3NldF9y
eF9uc3MoKSBpbgo+Pj4+IG1hYzgwMjExIGV4Y2VwdCB0aGUgZGVmbGluayB3aGljaCBtZWFucyB0
aGUgcHJpbWFyeSBsaW5rLgo+Pj4+IFRoaXMgbGVhZCBkcml2ZXIgZ2V0IG5zcyA9IDAgZm9yIG90
aGVyIGxpbmtzLiBXaWxsIHlvdSBmaXggaXQKPj4+PiBvciBpcyBpdCBkZXNpZ24gYnkgZGVmYXVs
dD8KPj4+Pgo+Pj4+IE9ubHkgcHJpbWFyeSBsaW5rIGhhcyB2YWxpZCByeF9uc3MgdmFsdWUgd2hp
Y2ggaXMgbm90IDAgYnkgYmVsb3cgY2FsbCBzdGFjay4KPj4+PiBpZWVlODAyMTFfYXNzb2Nfc3Vj
Y2VzcygpLT4KPj4+PiAgIMKgwqDCoCByYXRlX2NvbnRyb2xfcmF0ZV9pbml0KHN0YSk7Cj4+Pj4K
Pj4+PiBjb21taXQ6YzcxNDIwZGI2NTNhYmEzMGEyMzRkMWU0Y2Y4NmRkZTM3NmU2MDRmYQo+Pj4+
IHdpZmk6IG1hYzgwMjExOiBSQ1UtaWZ5IGxpbmsgU1RBIHBvaW50ZXJzCj4+PiBTdHJhbmdlIGZv
cm1hdCBhbmQgcy1vLWIgbWlzc2luZy4gV2FzIHRoaXMgbWVhbnQgYXMgYW4gUkZDIHBhdGNoPwo+
PiBUaGlzIGlzIG5vdCBhIHBhdGNoIGZvciByZXZpZXcsIGl0IGlzIHRvIGFzayBzb21lIHF1ZXN0
aW9uIGFib3V0IHRoZSBwYXRjaAo+Pgo+PiAid2lmaTogbWFjODAyMTE6IFJDVS1pZnkgbGluayBT
VEEgcG9pbnRlcnMiIHdoaWNoIGlzIGFscmVhZHkgdXBzdHJlYW0uCj4gVGhlbiB5b3Ugc2hvdWxk
IG5vdCBhZGQgIltQQVRDSF0iIGluIHRoZSBzdWJqZWN0LiBUaGUgc3RyaW5nICJbUEFUQ0hdIgo+
IGlzIHN1cHBvc2VkIHRvIGluZm9ybSB0aGF0IHRoZSBlbWFpbCBjb250YWlucyBhIHBhdGNoIHdo
aWNoIHNob3VsZCBiZQo+IGFwcGxpZWQuCj4KCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDEx
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vYXRoMTFrCg==
