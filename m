Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A5B5C0015E
	for <ath11k@archiver.kernel.org>; Wed, 26 Jul 2023 06:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YP+XSu3PVepQUwyJeeCevC58ojFk9X4+WCXIt6Np2P4=; b=uwH5ufF83UsOMp
	5DnDeJT2+YstAIQO9v2qTx7CTeMXD16Jw7B+gBCqSPdDMcscl1Qoa7l/qd1+PS4jSpgapXexJW3dD
	Vp9YGLnMYlyVVPftQvxqMddXIt0NLvO2HOuzKgnn8/BbcxYDByVEDDM4P6VYX7SabYpaSIuXNwEFT
	DwKPuTIQp5hgR89PHzKknUbvrlcgk2T5Bkiw6j6wst+JfZct82l+TTxQxKGBvvlIqvjcOZkUYwpEE
	ZgJfuEwCkMh3Rgtu16ehCIzl7dgYuC5XyMJQf60MHdJ02YeCPAbtHE4yumLG46PzO64RzkdcJmp8u
	KYXby1jwqjuyaiSMLmYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOY2v-009HP0-13;
	Wed, 26 Jul 2023 06:30:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOY2s-009HOW-06
	for ath11k@lists.infradead.org;
	Wed, 26 Jul 2023 06:30:51 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36Q6SimZ029697;
	Wed, 26 Jul 2023 06:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=oPOa//Mz6tsLcfVUiNna+BXRH2ABp9hZJUaMJLoFyOs=;
 b=jqHAVPrRO5WGj6LWWF40QEv4ihppULL8Wws7f3aZm3J6KMyq9jZj/QAVf4hiBrA5w4gk
 z3eby7gXfOoPtfNpMVGLtUCSPNXjKYfcavXrpLANpMIwNYxay5ombQSuDQe4l71FLHz3
 gXf+KIb9D5MoICwHL6brZjoaAeUaYUXnqXxl3gi9h0M2QepTSCsuTLr1WIbOCU1wxupM
 4C2ap+f69n1ZiD9tIhx+d/vah4l8nyG8C/rXCEfg4rmN7rXPSCbBT5bCo4cyVaAGWUD3
 4dxBq9xjAl1gbyNXHUctZj+G4LgOi1N/NwpkyYcpkfJOayEqabhVpYbCpIxuMSTiu5zo rw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s2cf8tdbn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jul 2023 06:30:47 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36Q6UkR6027913
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jul 2023 06:30:46 GMT
Received: from [10.231.195.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 25 Jul
 2023 23:30:45 -0700
Message-ID: <b5de662d-fd49-7b94-f617-89d4761c175b@quicinc.com>
Date: Wed, 26 Jul 2023 14:30:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: parsing the multi-link element with STA profile wifi: mac80211:
 support MLO authentication/association with one link
Content-Language: en-US
From: Wen Gong <quic_wgong@quicinc.com>
To: Johannes Berg <johannes@sipsolutions.net>,
        linux-wireless
	<linux-wireless@vger.kernel.org>
CC: <ath11k@lists.infradead.org>
References: <48715509-62fd-2307-e38f-176234b482c1@quicinc.com>
 <f240b33d507daf898480b0a11eb27d4475e45164.camel@sipsolutions.net>
 <571d8ecf-2ca6-8b7b-6e15-be12c56e9f88@quicinc.com>
 <e40ee96ab2a8d9d079d3a06b7b1c615ab25a2403.camel@sipsolutions.net>
 <2842f57c-e383-fb9e-d994-95336cb65e0d@quicinc.com>
 <6a33a41b5aa6c98d95ff934fbb6a10dfe78e6e6e.camel@sipsolutions.net>
 <2d3a6578-68c5-a0f3-b18b-bce2e67d3fdc@quicinc.com>
In-Reply-To: <2d3a6578-68c5-a0f3-b18b-bce2e67d3fdc@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -7wk_xVlqXn2Wo4aCQ6tZd-eXOgfxoNA
X-Proofpoint-GUID: -7wk_xVlqXn2Wo4aCQ6tZd-eXOgfxoNA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-25_14,2023-07-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307260057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_233050_073155_82B4ACFE 
X-CRM114-Status: GOOD (  16.31  )
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

SGkgSm9oYW5uZXMsCgpJIGd1ZXNzIHlvdSBoYXZlIGFscmVhZHkgZml4IGl0IGluIHNvbWUgcGF0
Y2gsIHJpZ2h0PwoKT24gNS8xMS8yMDIzIDc6MDEgUE0sIFdlbiBHb25nIHdyb3RlOgo+IE9uIDQv
MTgvMjAyMyA1OjExIFBNLCBKb2hhbm5lcyBCZXJnIHdyb3RlOgo+PiBPbiBUdWUsIDIwMjMtMDQt
MTggYXQgMTc6MDIgKzA4MDAsIFdlbiBHb25nIHdyb3RlOgo+Pj4gT24gNC8xOC8yMDIzIDQ6NDgg
UE0sIEpvaGFubmVzIEJlcmcgd3JvdGU6Cj4+Pj4gSGksCj4+Pj4KPj4+Pj4gTXkgY2FzZSBpczoK
Pj4+Pj4gV2hlbiBjb25uZWN0IHdpdGggMiBsaW5rcyBBUCwgdGhlIGNmZzgwMjExX2hvbGRfYnNz
KCkgaXMgY2FsbGVkIGJ5Cj4+Pj4+IGNmZzgwMjExX21sbWVfYXNzb2MoKQo+Pj4+PiBmb3IgZWFj
aCBCU1Mgb2YgdGhlIDIgbGlua3MsCj4+Pj4+Cj4+Pj4+IFdoZW4gYXNzc29jUmVzcCBmcm9tIEFQ
IGlzIG5vdCBzdWNjZXNzKHN1Y2ggYXMgc3RhdHVzX2NvZGU9PTEpLCB0aGUKPj4+Pj4gaWVlZTgw
MjExX2xpbmtfZGF0YSBvZiAybmQgbGluayhzZGF0YS0+bGlua1tsaW5rX2lkXSkKPj4+Pj4gaXMg
TlVMTCBiZWNhdXNlIAo+Pj4+PiBpZWVlODAyMTFfYXNzb2Nfc3VjY2VzcygpLT5pZWVlODAyMTFf
dmlmX3VwZGF0ZV9saW5rcygpCj4+Pj4+IGlzIG5vdCBjYWxsZWQuCj4+Pj4+Cj4+Pj4+IFRoZW4g
c3RydWN0IGNmZzgwMjExX3J4X2Fzc29jX3Jlc3AgcmVzcCBpbiAKPj4+Pj4gY2ZnODAyMTFfcnhf
YXNzb2NfcmVzcCgpIGFuZAo+Pj4+PiBzdHJ1Y3QgY2ZnODAyMTFfY29ubmVjdF9yZXNwX3BhcmFt
cyBjciBpbiBfX2NmZzgwMjExX2Nvbm5lY3RfcmVzdWx0KCkKPj4+Pj4gd2lsbCBvbmx5IGhhdmUg
dGhlIGRhdGEgb2YKPj4+Pj4gdGhlIDFzdCBsaW5rLCBhbmQgZmluYWxseSBjZmc4MDIxMV9jb25u
ZWN0X3Jlc3VsdF9yZWxlYXNlX2Jzc2VzKCkgCj4+Pj4+IG9ubHkKPj4+Pj4gY2FsbCBjZmc4MDIx
MV91bmhvbGRfYnNzKCkKPj4+Pj4gZm9yIHRoZSAxc3QgbGluaywgdGhlbiBCU1Mgb2YgdGhlIDJu
ZCBsaW5rIHdpbGwgbmV2ZXIgZnJlZSBiZWNhdXNlIAo+Pj4+PiBpdHMKPj4+Pj4gaG9sZCBpcyBh
d2xheXMgPiAwIG5vdy4KPj4+PiBIYWgsIHllcywgb3VjaC4KPj4+Pgo+Pj4+PiBJIGZvdW5kIGl0
IGlzIG5vdCBlYXN5IHRvIHJlZmluZSBpdCwgc28gZG8geW91IGhhdmUgYW55IGFkdmlzZS9pZGVh
Pwo+Pj4+Pgo+Pj4+PiBmb3IgKGxpbmtfaWQgPSAwOyBsaW5rX2lkIDwgSUVFRTgwMjExX01MRF9N
QVhfTlVNX0xJTktTOyBsaW5rX2lkKyspIHsKPj4+Pj4gwqDCoCDCoMKgwqDCoMKgwqDCoCBzdHJ1
Y3QgaWVlZTgwMjExX2xpbmtfZGF0YSAqbGluazsKPj4+Pj4KPj4+Pj4gwqDCoCDCoMKgwqDCoMKg
wqDCoCBsaW5rID0gc2RhdGFfZGVyZWZlcmVuY2Uoc2RhdGEtPmxpbmtbbGlua19pZF0sIHNkYXRh
KTsKPj4+Pj4gwqDCoCDCoMKgwqDCoMKgwqDCoCBpZiAoIWxpbmspCj4+Pj4+IMKgwqAgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZTsKPj4+Pj4KPj4+Pj4gwqDCoCDCoMKgwqDCoMKgwqDC
oCBpZiAoIWFzc29jX2RhdGEtPmxpbmtbbGlua19pZF0uYnNzKQo+Pj4+PiDCoMKgIMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgY29udGludWU7Cj4+Pj4+Cj4+Pj4+IMKgwqAgwqDCoMKgwqDCoMKgwqAg
cmVzcC5saW5rc1tsaW5rX2lkXS5ic3MgPSBhc3NvY19kYXRhLT5saW5rW2xpbmtfaWRdLmJzczsK
Pj4+Pj4gwqDCoCDCoMKgwqDCoMKgwqDCoCByZXNwLmxpbmtzW2xpbmtfaWRdLmFkZHIgPSBsaW5r
LT5jb25mLT5hZGRyOwo+Pj4+PiDCoMKgIMKgwqDCoMKgwqDCoMKgIHJlc3AubGlua3NbbGlua19p
ZF0uc3RhdHVzID0gCj4+Pj4+IGFzc29jX2RhdGEtPmxpbmtbbGlua19pZF0uc3RhdHVzOwo+Pj4+
Pgo+Pj4+IEJ1dCBpcyBpdCByZWFsbHkgc28gaGFyZD8gV2Ugb25seSBuZWVkIGxpbmsgZm9yIGxp
bmstPmNvbmYtPmFkZHIsIAo+Pj4+IGFuZCB3ZQo+Pj4+IGNhbiB1c2UgYXNzb2NfZGF0YS0+bGlu
a1tsaW5rX2lkXS5hZGRyIGZvciB0aGF0IGluc3RlYWQsIG5vPyBXZSAKPj4+PiBuZWVkIHRvCj4+
Pj4gc3RvcmUgdGhvc2UgbG9jYWxseSB0byBhdm9pZCBhIHVzZS1hZnRlci1mcmVlLCBidXQgdGhh
dCdzIGF0IG1vc3QgMTUKPj4+PiBhZGRyZXNzZXMgb24gdGhlIHN0YWNrLCB3aGljaCBzZWVtcyBh
Y2NlcHRhYmxlPwo+Pj4+Cj4+Pj4gT2ggYW5kIHRoZXJlJ3MgdGhlIHVhcHNkIHN0dWZmIGJ1dCB0
aGF0IG9ubHkgbWF0dGVycyBpbiB0aGUgc3VjY2VzcyAKPj4+PiBjYXNlCj4+Pj4gYW55d2F5LiBJ
biBmYWN0IEknbSBub3QgZXZlbiBzdXJlIHRoZSBhZGRyZXNzIG1hdHRlcnMgaW4gdGhlCj4+Pj4g
dW5zdWNjZXNzZnVsIGNhc2UgYnV0IHdlIGhhdmUgaXQgcHJldHR5IGVhc2lseS4KPj4+Pgo+Pj4+
IGpvaGFubmVzCj4+PiBPSy4gU28gSSBndWVzcyB5b3UgYWxyZWFkeSBoYXZlIGdvb2Qgd2F5IHRv
IHJlZmluZSBpdD8KPj4+Cj4+IE5vLCBub3QgcmVhbGx5LCB3YXMganVzdCB0aGlua2luZyBvdXQg
bG91ZCBoZXJlIDopCj4+Cj4+IGpvaGFubmVzCj4KPiBIaSBKb2hhbm5lcywgaWYgeW91IGhhdmUg
YW55IHBhdGNoIHRvIGZpeCBpdCwgSSBjYW4gZG93bmxvYWQgYW5kIHRlc3QuCj4KCi0tIAphdGgx
MWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
