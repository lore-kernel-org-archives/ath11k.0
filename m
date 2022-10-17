Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED8AC433FE
	for <ath11k@archiver.kernel.org>; Mon, 17 Oct 2022 08:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hGMgN2mg52pkP4E3WclS28quu02lKh+U2mO5h32g7ng=; b=IA2vDET4hWzTyF
	/tY+xVfXrWVcWjt9/4jrf4/dZgT4gh2uJ4uvXQfEv1n/xFmaUyEwuUc0yGHfEI4hw4a4WprCiYTYL
	o02o0OLrOKyR0BQMg/t4UIFrnhfYXPEDzDDsdGG1EihSCqFy1GR89kegq+y3yFgL+zQeLcMzH3ENv
	f2FDzTIwlMgnn8PVgG71GMzioxXAtk4p8BGlg8xh9efKXrtgyr2Dh81LJ0P2jgh0H8HZY8RW2uMnW
	wRA5KcfE4GCYYbSSwzletXHzgmYIw0P3I6iooolwKdvmmEsIs6rxauHPSFYxHTIn8f+nhh7DztUJ3
	Krn/W3BC/dKakxfWVgtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okL3W-008ndE-9l; Mon, 17 Oct 2022 08:01:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okL3S-008nW4-OR
	for ath11k@lists.infradead.org; Mon, 17 Oct 2022 08:01:00 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29H7vvqf008054;
	Mon, 17 Oct 2022 08:00:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=fj6B2hPCG6SFwfXKayNhNHI+3qCrqeWLvAA0xiWUD8Y=;
 b=El5mFIW3LlKBjFATlD7zTzzLxKo+nIkC6mMCC6pZ67fCUdxFffQwFJPs/OEgPWJE6VMK
 zwgRYLEwgEMi/1P0P1YonLNssvgLu54bnAFR94K0jOQgZLunwFcgd9zf4CpZbbuMSmqg
 JwV1HqPK2ReeR/r9I74V9pkAAmcJMNfVjqOGWUcyDvNAFftjOzKoYpgbzvSiIkODFli1
 X5kdRY1IsM5d5qoq89vaDJ2JTOKQoxhG9J1WrDSdy6pq6uejznChYoZj1DYaLGT31tHq
 idrU2ly/K5hwu4Z0zCM68y9N4PNRMlF0a2ofSqamATT3KSGM9q/E0icOiMFfMYKaw5KM ZQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k7mf7kcpm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Oct 2022 08:00:57 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29H80uwM003659
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Oct 2022 08:00:56 GMT
Received: from [10.231.195.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 17 Oct
 2022 01:00:55 -0700
Message-ID: <c52e6634-4a90-f165-9f41-8f23df9414a4@quicinc.com>
Date: Mon, 17 Oct 2022 16:00:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: wifi: mac80211: mlo rx nss value 0 of wifi
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>,
        linux-wireless
	<linux-wireless@vger.kernel.org>
CC: <ath11k@lists.infradead.org>
References: <913ee04f-a16f-f765-96c2-0586282831b4@quicinc.com>
 <1a440c62-ffd0-9602-9454-f08765beadf0@quicinc.com>
 <91b975e2116521cfa9f9371a976039a53ed9a85c.camel@sipsolutions.net>
 <2a2c466fbdcc2c3cc7af81bcd4d370d0119ea865.camel@sipsolutions.net>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <2a2c466fbdcc2c3cc7af81bcd4d370d0119ea865.camel@sipsolutions.net>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qcD2RTut2kohBiHBgMR-HRhDKiLmoJUQ
X-Proofpoint-ORIG-GUID: qcD2RTut2kohBiHBgMR-HRhDKiLmoJUQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-17_06,2022-10-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210170046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_010058_927427_1CAC8E5F 
X-CRM114-Status: GOOD (  16.53  )
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

T24gMTAvMTcvMjAyMiAzOjQ5IFBNLCBKb2hhbm5lcyBCZXJnIHdyb3RlOgo+IE9uIE1vbiwgMjAy
Mi0xMC0xNyBhdCAwOTo0OCArMDIwMCwgSm9oYW5uZXMgQmVyZyB3cm90ZToKPj4gSGksCj4+Cj4+
Pj4gQ3VycmVudGx5IGZvciBNTE8gdGVzdCwgdGhlIG90aGVycyBsaW5rcydzIHJ4X25zcyBvZiBz
dHJ1Y3QKPj4+PiBpZWVlODAyMTFfbGlua19zdGEgaXMgc3RpbGwgdmFsdWUgMCBpbiBpZWVlODAy
MTFfc2V0X2Fzc29jaWF0ZWQoKSwKPj4+PiBiZWNhdWUgdGhleSBhcmUgbm90IHBhc3MgaW50byBp
ZWVlODAyMTFfc3RhX3NldF9yeF9uc3MoKSBpbgo+Pj4+IG1hYzgwMjExIGV4Y2VwdCB0aGUgZGVm
bGluayB3aGljaCBtZWFucyB0aGUgcHJpbWFyeSBsaW5rIGluCj4+Pj4gcmF0ZV9jb250cm9sX3Jh
dGVfaW5pdCgpLiBUaGlzIGxlYWQgZHJpdmVyIGdldCBuc3MgPSAwIGZvcgo+Pj4+IG90aGVyIGxp
bmtzLiBXaWxsIHlvdSBmaXggaXQgb3IgaXMgaXQgZGVzaWduIGJ5IGRlZmF1bHQ/Cj4+Pj4KPj4+
PiBPbmx5IHByaW1hcnkgbGluayBoYXMgdmFsaWQgcnhfbnNzIHZhbHVlIHdoaWNoIGlzIG5vdCAw
IGJ5IGJlbG93IGNhbGwKPj4+PiBzdGFjay4KPj4+PiBpZWVlODAyMTFfYXNzb2Nfc3VjY2Vzcygp
Cj4+Pj4gIMKgwqDCoCAtPnJhdGVfY29udHJvbF9yYXRlX2luaXQoc3RhKTsKPj4+PiAgwqDCoCDC
oMKgwqDCoCAtPmllZWU4MDIxMV9zdGFfc2V0X3J4X25zcygmc3RhLT5kZWZsaW5rKTsKPj4gUmln
aHQsIG5vbmUgb2YgdGhlIHJhdGUgc2NhbGluZyByZWxhdGVkIHN0dWZmIHdhcyB1cGRhdGVkIHll
dC4KPj4KPiBUaG91Z2ggZm9yIHRoaXMgY2FzZSBtYXliZSB3ZSBjYW4ganVzdCBtb3ZlIGllZWU4
MDIxMV9zdGFfc2V0X3J4X25zcygpCj4gdG8gc29tZSBiZXR0ZXIgcGxhY2Ugb3V0c2lkZSBvZiBy
YXRlX2NvbnRyb2xfcmF0ZV9pbml0KCkgYW5kIGhhdmUgaXQKPiBkb25lIHdpdGggdGhlIHJpZ2h0
IGxpbmssIGFuZCBhbHNvIG9uIGNoYW5nZXM/Cj4KPiBqb2hhbm5lcwoKSSBkaWQgYmVsb3cgY2hh
bmdlIGluIG15IGludGVybmFsIHRlc3QsIGFuZCBub3QgZm91bmQgdGhlIE5TUz0wIGlzc3VlIAph
Z2FpbiBmb3IgMiBsaW5rIE1MTy4KCndpZmk6IG1hYzgwMjExOiB1cGRhdGUgYWxsIGxpbmtzIHJ4
IG5zcyBieSBpZWVlODAyMTFfc3RhX3NldF9yeF9uc3MoKSBpbiAKaWVlZTgwMjExX2Fzc29jX3N1
Y2Nlc3MoKQoKCmRpZmYgLS1naXQgYS9uZXQvbWFjODAyMTEvbWxtZS5jIGIvbmV0L21hYzgwMjEx
L21sbWUuYwppbmRleCBhMjFlMGYzNDQyM2IuLmYwMzU2ODUxMmYwNSAxMDA2NDQKLS0tIGEvbmV0
L21hYzgwMjExL21sbWUuYworKysgYi9uZXQvbWFjODAyMTEvbWxtZS5jCkBAIC00OTcyLDYgKzQ5
NzIsMTMgQEAgc3RhdGljIGJvb2wgaWVlZTgwMjExX2Fzc29jX3N1Y2Nlc3Moc3RydWN0IAppZWVl
ODAyMTFfc3ViX2lmX2RhdGEgKnNkYXRhLAogwqDCoMKgwqDCoMKgwqAgfQoKIMKgwqDCoMKgwqDC
oMKgIHJhdGVfY29udHJvbF9yYXRlX2luaXQoc3RhKTsKK8KgwqDCoMKgwqDCoCBmb3IgKGxpbmtf
aWQgPSAwOyBsaW5rX2lkIDwgSUVFRTgwMjExX01MRF9NQVhfTlVNX0xJTktTOyAKbGlua19pZCsr
KSB7CivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICghKHN0YS0+c3RhLnZhbGlkX2xp
bmtzICYgQklUKGxpbmtfaWQpKSB8fAorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHN0YS0+ZGVmbGluay5saW5rX2lkID09IGxpbmtfaWQpCivCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZTsKKworwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBpZWVlODAyMTFfc3RhX3NldF9yeF9uc3Moc3RhLT5saW5rW2xpbmtfaWRdKTsK
K8KgwqDCoMKgwqDCoCB9CgogwqDCoMKgwqDCoMKgwqAgaWYgKGlmbWdkLT5mbGFncyAmIElFRUU4
MDIxMV9TVEFfTUZQX0VOQUJMRUQpIHsKIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBz
ZXRfc3RhX2ZsYWcoc3RhLCBXTEFOX1NUQV9NRlApOwoKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0
CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
