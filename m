Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF9C6EB64D7
	for <ath11k@archiver.kernel.org>; Wed, 21 Jun 2023 07:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NVAt4dP2nirSvtkFlt9YzSyS2GXoTXP1H46kkdnHiog=; b=1YfzR2if0MOcGu
	pYCszhoMEF0cnW2teATGQg3yCq+cksml762jYDAFaNCyu8kOMF+Y9+cu6sPlX2iTqYxq2SuhbNA4S
	kfQYbxR/E3afBjYNQhB4HMu8WC5SpjjDstX3sLdVIPz0bVYtZm9EnsYC5XDBOWfigNw1V4etAhp5q
	KI2+L0LtTinbe5uIoL9NFvKKlnUzWI00TtcgYOD1YuztrC+W8kor2yPVh2owXTL41LCQhb8NpEr/V
	AHk+jf5pAWBcLeoWlkIKoUWcKxxJ/+BZZGCrGAemUJ6JGCg811+TJUt35/HABviZJ0Tl9IypiIaeC
	EqDqQyGPShgEA4VuwDqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBsgS-00DbbS-17;
	Wed, 21 Jun 2023 07:55:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBsgP-00Dba5-15
	for ath11k@lists.infradead.org;
	Wed, 21 Jun 2023 07:55:18 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35L7BhhZ011863;
	Wed, 21 Jun 2023 07:55:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Sz1GNTMKBDD2FFF09wY90cMKcQXa3FWB0E73B/6CyJc=;
 b=psX+rJIeR01qRklDIuJqp0wCK4C0iDX+1kXJdmDqbIud5V4wlvxMScPvJ+uyypPzK5uR
 71AVptv3oDhaJjQuEHW0u2ZiYTim8nvWClsRi8PVy2x2VBzHZKHIQ8tfu/i82/+ZyHID
 v926B9KdB7XGW3cNBLtqxCT72u9qTANXbFknFPtw2xQ1SigAUV9aswhpTRRUV+RbvS/o
 Labr9VtKd63XPwJcKYLcg3i7sAyW8xOnwZlBiI4wl1hh5cB2Bgr1OxgL/dgIsP2XhIRE
 e7dMMF7nRulf6t8cQU/S+WtrhDv5hB/p4Ew2xXbhlpfeu4GaxzM6c0AXj6VFW/ZsL4Zh 7w== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rbqu2gjye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 07:55:11 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35L7tA16005012
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 07:55:10 GMT
Received: from [10.253.76.127] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 21 Jun
 2023 00:55:08 -0700
Message-ID: <b6314b61-0700-0e1c-7b39-21c305dc28b3@quicinc.com>
Date: Wed, 21 Jun 2023 15:55:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 10/27] wifi: mac80211: isolate driver from inactive links
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>,
        <linux-wireless@vger.kernel.org>
CC: <ath11k@lists.infradead.org>
References: <20220902141259.377789-1-johannes@sipsolutions.net>
 <20220902161143.5ce3dad3be7c.I92e9f7a6c120cd4a3631baf486ad8b6aafcd796f@changeid>
 <5d82e564-86bf-c26b-077a-d0bc14e2d3c3@quicinc.com>
 <74f3eb848326607b15336c31a02bdd861ccafb47.camel@sipsolutions.net>
 <d10b88b4-0bd7-a38c-e8d7-8982a281c4b3@quicinc.com>
 <e5adbed1524b27228c152ba14f78c550c8730baa.camel@sipsolutions.net>
 <c15e368e-2fea-a1d8-9c0d-db9278ded5e5@quicinc.com>
 <113761966918b2f390d3c9304307b42a0b4a829b.camel@sipsolutions.net>
 <76863dec-1b2f-b933-7c5e-21c732de4bc6@quicinc.com>
 <2cc79101249548f2a92c14af6aff6121143907d6.camel@sipsolutions.net>
 <1c26c205-0240-7670-117d-02a7af068724@quicinc.com>
 <6f8db032286923845202c7d658f1d39db79a758c.camel@sipsolutions.net>
 <a7093d7a-0179-7b5f-cc61-a501331d35c6@quicinc.com>
 <c60af4eb116ed330e8035503fb7944f8853bcfa4.camel@sipsolutions.net>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <c60af4eb116ed330e8035503fb7944f8853bcfa4.camel@sipsolutions.net>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: CyUp4fO-_12Obd0MqDcRhbLWBdGu7OuD
X-Proofpoint-GUID: CyUp4fO-_12Obd0MqDcRhbLWBdGu7OuD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-21_05,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 mlxscore=0 spamscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 mlxlogscore=824 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306210065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_005517_385978_276E1A8D 
X-CRM114-Status: GOOD (  27.88  )
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

T24gNi8xNS8yMDIzIDM6NTYgUE0sIEpvaGFubmVzIEJlcmcgd3JvdGU6Cj4gT24gVGh1LCAyMDIz
LTA2LTE1IGF0IDEwOjI2ICswODAwLCBXZW4gR29uZyB3cm90ZToKPj4gT24gNi8xNS8yMDIzIDI6
MzIgQU0sIEpvaGFubmVzIEJlcmcgd3JvdGU6Cj4+PiBPbiBXZWQsIDIwMjMtMDUtMjQgYXQgMTU6
NDEgKzA4MDAsIFdlbiBHb25nIHdyb3RlOgo+Pj4+IE1heSBJIGFkZCBhIG5ldyBvcHMgaW4gc3Ry
dWN0IGllZWU4MDIxMV9vcHM/IGxpa2UgdGhpczoKPj4+Pgo+Pj4+IHUxNiBhY3RpdmVfbGlua3Mo
c3RydWN0IGllZWU4MDIxMV9odyAqaHcsIHN0cnVjdCBpZWVlODAyMTFfdmlmIHZpZiwgdTE2Cj4+
Pj4gbmV3X2xpbmtzKSIKPj4+Pgo+Pj4+IHRoZW4gaWVlZTgwMjExX3NldF92aWZfbGlua3NfYml0
bWFwcygpIGNhbGwgdGhlIG9wcyB0byBnZXQgdGhlIGxpbmtzIGZvcgo+Pj4+IHN0YXRpb24gYW5k
IHNldCB0aGUgc2RhdGEtPnZpZi5hY3RpdmVfbGlua3Mgd2l0aCB0aGUgcmV0dXJuIHZhbHVlIGZy
b20KPj4+PiBsb3dlciBkcml2ZXIsCj4+Pj4gaXQgbWVhbnMgbG93ZXIgZHJpdmVyIHdpbGwgZHlu
YW1pYyBzZWxlY3QgdGhlIGxpbmtzIGNvdW50IGF0IHRoaXMgbW9tZW50Lgo+Pj4+Cj4+Pj4gSWYg
bG93ZXIgZHJpdmVyIG5vdCByZWdpc3RlciBvcHMgYWN0aXZlX2xpbmtzLCB0aGVuIGtlZXAgY3Vy
cmVudCBsb2dpYy4KPj4+Pgo+Pj4gSSBndWVzcyB5b3UgY2FuIGNhbiBzZW5kIHBhdGNoZXMgZm9y
IHdoYXRldmVyIHlvdSB3YW50IDopCj4+Pgo+Pj4gQnV0IEkgaGF2ZSBubyBpZGVhIHdoYXQgeW91
J3JlIHRyeWluZyB0byBkbz8gV2h5IHdvdWxkIHlvdSBuZWVkIHRvIGhhdmUKPj4+IGEgY2FsbGJh
Y2s/Cj4+IEN1cnJlbnRseSBkcml2ZXIgY291bGQgdXNlIGllZWU4MDIxMV9zZXRfYWN0aXZlX2xp
bmtzX2FzeW5jKCkgdG8gYWN0aXZlCj4+IGxpbmtzIGFmdGVyIGNvbm5lY3Rpb24gY29tcGxldGVk
Lgo+IFJpZ2h0Lgo+Cj4+IEJ1dCBJIHdvdWxkIGxpa2UgdG8gYWxsb3cgZHJpdmVyIHRvIHNlbGVj
dCBhY3RpdmUgbGlua3MgaW4gYSBlYXJseSB0aW1lLAo+PiBpdCB3aWxsIGJlIG1vcmUgY29udmVu
aWVudCBmb3IgZHJpdmVyLgo+IEhvdyBzbz8gQWxsIHlvdSBoYXZlIHRvIGRvIGlzIGxvb2sgZm9y
IHRoZSBjb25uZWN0aW9uIGJlY29taW5nCj4gYXV0aG9yaXplZCAoZS5nLiBzdGEgc3RhdGUgZm9y
IHRoZSBBUCBtb3ZpbmcgdG8gYXV0aG9yaXplZCkgYW5kIHRoZW4KPiBzZWxlY3RpbmcgdGhlIGxp
bmtzIHlvdSB3YW50LiBXZSd2ZSBhbHJlYWR5IGJlZW4gd29ya2luZyBvbiB0aGF0LCBpdCdzCj4g
cmVhbGx5IGVhc3k/Ckl0IGlzIG1vcmUgY29tcGxleCBmb3IgYXRoMTJrIGRyaXZlcnMuCj4KPiBP
biB0aGUgZmxpcC1zaWRlLCBpdCB3b3VsZCBiZSBoaWdobHkgaW5jb252ZW5pZW50IGZvciBtYWM4
MDIxMSB0byB0cnkgdG8KPiBlbmFibGUgbW9yZSBsaW5rcyAqZHVyaW5nKiB0aGUgYXNzb2NpYXRp
b24gcHJvY2VzcywgYW5kIGFjdHVhbGx5IGl0J3MKPiBub3QgZXZlbiBhbGxvd2VkIGJ5IHNwZWMg
dW50aWwgdGhlIDQtd2F5LUhTIGZpbmlzaGVzLiBTbyB0aGUgZWFybGllc3QKPiBwb3NzaWJsZSB0
aW1lIGlzIHByZXR0eSBtdWNoIHdoZW4geW91IGNhbiBqdXN0IGRvIGl0IGluIHRoZSBkcml2ZXIg
YXMgSQo+IGp1c3QgZGVzY3JpYmVkLgo+Cj4+PiBXYXMgdGhpcyBmb3IgbGluayBzZWxlY3Rpb24g
aW4gdGhlIGRyaXZlcj8gV2Ugc2hvdWxkIGhhdmUgYSBwYXRjaAo+Pj4gc29tZXdoZXJlIHRoYXQg
YWRkcyBhIEJTU19DSEFOR0UgZmxhZyBmb3Igd2hlbiB0aGUgdmFsaWQgbGlua3MgY2hhbmdlLAo+
Pj4gc28gdGhlIGRyaXZlciBjYW4gc2VsZWN0IG90aGVycy4KPj4+Cj4+PiBqb2hhbm5lcwo+PiBZ
ZXMsIGl0IGlzIGZvciBsaW5rIHNlbGVjdGlvbiBpbiBkcml2ZXIgYXQgYSBlYXJseSB0aW1lIGJl
Zm9yZQo+PiBjb25uZWN0aW9uIGNvbXBsZXRlZC4KPiBUaGlzIGlzIG5vdCByZWFsbHkgYWxsb3dl
ZCAuLi4gQXQgbGVhc3Qgbm90IHdpdGhvdXQgYWxzbyBmaW5kaW5nIHdheXMgdG8KPiByZWFsbHkg
dHJhbnNtaXQgdGhlIDgwMi4xWCBhbmQgNC13YXktSFMgb25seSBvbiB0aGUgcmlnaHQgbGluaywg
ZXRjLgpZZXMsIEkgYWxzbyBmb3VuZCB0aGlzIGluIHNlY3Rpb24gIjIuNy42LjEgR2VuZXJhbCLC
oCBvZiBJRUVFIFA4MDIuMTFiZToKIkZvciBNTE8sIGlmIFJTTkEgaGFzIG5vdCBiZWVuIGVzdGFi
bGlzaGVkLCBlYWNoIG1lc3NhZ2Ugb2YgdGhlIDQtd2F5IApoYW5kc2hha2Ugc2hhbGwgYmUgc2Vu
dCBvbgp0aGUgc2FtZSBsaW5rIHVzZWQgYnkgdGhlIGxhdGVzdCBleGNoYW5nZSBvZiBzdWNjZXNz
ZnVsIChSZSlBc3NvY2lhdGlvbiAKUmVxdWVzdC9SZXNwb25zZSBmcmFtZXMuIgoKRm9yIGF0aDEy
ayBkcml2ZXJzLCBvbmx5IHRoZSBwcmltYXJ5IGxpbmsodGhlIGxpbmsgdXNlZCBieSB0aGUgbGF0
ZXN0IApleGNoYW5nZSBvZiBzdWNjZXNzZnVsIChSZSlBc3NvY2lhdGlvbgpSZXF1ZXN0L1Jlc3Bv
bnNlIGZyYW1lcykgaXMgYWN0aXZlIGJlZm9yZSBrZXkgaW5zdGFsbGVkLCBzbyB0aGUgODAyLjFY
IAphbmQgNC13YXktSFMgd2lsbCBhbHdheXMgc2VudCBvbgp0aGUgcHJpbWFyeSBsaW5rLCBzbyBp
dCB3aWxsIG1lZXQgdGhlIHJ1bGUgYWJvdmUgb2Ygc2VjdGlvbiAiMi43LjYuMSAKR2VuZXJhbCIu
CgpJdCBtZWFuczogbG93ZXIgZHJpdmVyIHdpbGwgZW5zdXJlIHRoZSBydWxlIHdoZW4gaXQgaW1w
bG1lbnRlZCB0aGUgCmFjdGl2ZV9saW5rcyBjYWxsYmFjayBzdWNoIGFzIGF0aDEyay4KPj4gQ291
bGQgeW91IHRlbGwgZGV0YWlsIGFib3V0IGhvdyB0aGUgQlNTX0NIQU5HRSBmbGFnIHdvcmtzP/Cf
mIEKPiBUaGUgd29yayBpc24ndCBjb21wbGV0ZSB5ZXQsIGJ1dCBiYXNpY2FsbHkgaXQganVzdCBj
YWxscyB0aGUgY2FsbGJhY2sKPiB3aGVuZXZlciB0aGUgdmFsaWRfbGlua3MgY2hhbmdlZCwgc2F5
IGJ5IGxpbmstcmVjb25maWd1cmF0aW9uLgo+Cj4gam9oYW5uZXMKCi0tIAphdGgxMWsgbWFpbGlu
ZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
