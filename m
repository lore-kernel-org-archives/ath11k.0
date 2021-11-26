Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E50BC433F5
	for <ath11k@archiver.kernel.org>; Fri, 26 Nov 2021 06:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l3CdTbme+JN8Rj5afRBhBDSltx5V4UBAuZcvBsY5Qf0=; b=b19L2SU+PU2kna
	LH0S859Jbs8y/bM8iLpZofDyKZ9tN8wZzemFGsUUyWabao+BV/130hz58eyg6OD98kwEVog2PlPe1
	i39RlyAKD5v+Kx5afKMNfiLI1Lzv+fDtMJcNen8EYuMV30/YQ3m6YLCkVaX7PpxyTp30MRzp8dUaG
	77RUI8BO7JWuLOPlPWNPdaB0RdvLFkA/r5LnWkclY85vRmUcBR8inGSr+MaLfE3hCmfDkDME25lF8
	87CsRkiW4soY/I0LInqoRcUPmgwUoQNIgFspuvFS9CT/7lBGr0WLCofuOZHC75VzLUmA/SoF6iVIG
	+2a7UAghYsuq0YvWcUPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqV87-009N4W-3a; Fri, 26 Nov 2021 06:54:43 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqV84-009N3e-H9
 for ath11k@lists.infradead.org; Fri, 26 Nov 2021 06:54:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1637909680; x=1669445680;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=DrvK08oQNJfPnaNUh5MjFL2jVPdYwk4HW0BWKsUchZE=;
 b=ytsu4lFR7U2CHseRPFGJJRVTGbVvyqgYGl2t9gaGYUKfyZnq7mM4mHp4
 7673MsrTgTlBXWLS4ovwzuaT3JN4q/8l1TbzM6YB7cwgvZRHK3/mazdiw
 q32vlN1NmkMPZDdcgpk/nib+VzMH5wRWhoZPaqqyR37kepmi502AXRpJF I=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 25 Nov 2021 22:54:40 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2021 22:54:39 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 25 Nov 2021 22:54:39 -0800
Received: from [10.231.195.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Thu, 25 Nov
 2021 22:54:38 -0800
Message-ID: <b91ce5b3-d000-e42b-a67c-dd377123440d@quicinc.com>
Date: Fri, 26 Nov 2021 14:54:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2] ath11k: add wait operation for tx management packets
 for flush from mac80211
Content-Language: en-US
From: Wen Gong <quic_wgong@quicinc.com>
To: Kalle Valo <kvalo@codeaurora.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20211118095254.7916-1-quic_wgong@quicinc.com>
 <871r389ycu.fsf@codeaurora.org>
 <f19a7d40-02a4-f651-44c6-2e8f0c14ce9f@quicinc.com>
In-Reply-To: <f19a7d40-02a4-f651-44c6-2e8f0c14ce9f@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_225440_624921_177465B0 
X-CRM114-Status: GOOD (  14.28  )
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

SGkgS2FsbGUsCgpJIGhhdmUgc2VudCBuZXcgdmVyc2lvbiBwYXRjaCwgSSBoYXZlIHRlc3QgaXQg
Zm9yIGNvbm5lY3QvZGlzY29ubmVjdCwgaXQgCmlzIE9LIG5vdywgaXQgd2lsbCBub3QgaGFwcGVu
IHRpbWVkIG91dC4KCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC13
aXJlbGVzcy9wYXRjaC8yMDIxMTEyNjA2NDkzNC4yNjQ5MC0xLXF1aWNfd2dvbmdAcXVpY2luYy5j
b20vCgpbUEFUQ0ggdjNdIGF0aDExazogYWRkIHdhaXQgb3BlcmF0aW9uIGZvciB0eCBtYW5hZ2Vt
ZW50IHBhY2tldHMgZm9yIApmbHVzaCBmcm9tIG1hYzgwMjExCgpPbiAxMS8yNi8yMDIxIDExOjMy
IEFNLCBXZW4gR29uZyB3cm90ZToKPiBIaSBLYWxsZSwKPgo+IEkgaGF2ZSBmb3VuZCB0aGUgcmVh
c29uLgo+Cj4gSSB3aWxsIHNlbmQgbmV3IHZlcnNpb24gdG8gZml4IGl0Lgo+Cj4gSXQgaXMgYmVj
YXVzZSBjb21taXQgYzBiMGQyZTg3ZDkxY2UyODNjODc2NmI0YjNjMmVjOWFjOTBlYmY5NiAoYXRo
MTFrOiAKPiBJbmNyZW1lbnQgcGVuZGluZ19tZ210X3R4IGNvdW50IGJlZm9yZSB0eCBzZW5kIGlu
dm9rZSkgd2hpY2ggY29tbWl0IGF0IAo+IE5vdiAxNSAxMToyNTo1MiAyMDIxLgo+Cj4gQW5kIG15
IHJlYmFzZSBpcyBhdXRvIG1lcmdlZCBieSBnaXQsIHRoZW4gaXQgaW5jIHR3aWNlIGZvciAKPiBu
dW1fcGVuZGluZ19tZ210X3R4Lgo+Cj4gd2dvbmdAd2dvbmctSFAzLVoyMzAtU0ZGLVdvcmtzdGF0
aW9uOn4vYXRoMTFrL2F0aC11cHN0cmVhbSQgZ2l0IAo+IGNoZXJyeS1waWNrIDA4Njk2MTAxNzhh
MQo+IEF1dG8tbWVyZ2luZyBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL3dtaS5jCj4g
QXV0by1tZXJnaW5nIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvbWFjLmMKPiBBdXRv
LW1lcmdpbmcgZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDExay9jb3JlLmgKPiBBdXRvLW1l
cmdpbmcgZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDExay9jb3JlLmMKPiBbYWRkX3dhaXRf
bWdtdF9hdGgtMjAyMTExMjIxNDM2IDk1NGQyMzNkYmUzNF0gYXRoMTFrOiBhZGQgd2FpdCAKPiBv
cGVyYXRpb24gZm9yIHR4IG1hbmFnZW1lbnQgcGFja2V0cyBmb3IgZmx1c2ggZnJvbSBtYWM4MDIx
MQo+Cj4gT24gMTEvMjIvMjAyMSA4OjE5IFBNLCBLYWxsZSBWYWxvIHdyb3RlOgo+PiBXZW4gR29u
ZyA8cXVpY193Z29uZ0BxdWljaW5jLmNvbT4gd3JpdGVzOgo+Pgo+Pj4gSW4gYXRoMTFrLCB0eCBv
ZiBtYW5hZ2VtZW50IHBhY2tldCBpcyBkb2luZyBpbiBhIHdvcmsgcXVldWUuIFNvbWV0aW1lcwo+
Pj4gdGhlIHdvcmtxdWV1ZSBkb2VzIG5vdCBmaW5pc2ggdHggaW1tZWRpYXRlbHksIHRoZW4gaXQg
bGVhZCBhZnRlciB0aGUgCj4+PiBuZXh0Cj4+PiBzdGVwIG9mIHZkZXYgZGVsZXRlIGZpbmlzaGVk
LCBpdCBzdGFydCB0byBzZW5kIHRoZSBtYW5hZ2VtZW50IHBhY2tldCB0bwo+Pj4gZmlybXdhcmUg
YW5kIGxlYWQgZmlybXdhcmUgY3Jhc2guCj4+Pgo+Pj4gaWVlZTgwMjExX3NldF9kaXNhc3NvYyBo
YXZlIGxvZ2ljIG9mIGllZWU4MDIxMV9mbHVzaF9xdWV1ZXMgYWZ0ZXIgaXQKPj4+IHNlbmRfZGVh
dXRoX2Rpc2Fzc29jIHRvIGF0aDExaywgaXRzIHB1cnBvc2UgaXMgbWFrZSBzdXJlIHRoZSBkZWF1
dGgKPj4+IHdhcyBhY3R1YWxseSBzZW50LCBzbyBpdCBuZWVkIHRvIGNoYW5nZSBhdGgxMWsgdG8g
bWF0Y2ggdGhlIHB1cnBvc2UKPj4+IG9mIG1hYzgwMjExLgo+Pj4KPj4+IFRvIGFkZHJlc3MgdGhl
c2UgaXNzdWUgd2FpdCBmb3IgdHggbWdtdCBhbmQgdHggZGF0YSBwYWNrZXRzLgo+Pj4KPj4+IFRl
c3RlZC1vbjogUUNBNjM5MCBodzIuMCBQQ0kgCj4+PiBXTEFOLkhTVC4xLjAuMS0wMTIzMC1RQ0FI
U1RTV1BMWl9WMl9UT19YODYtMQo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFdlbiBHb25nIDxxdWlj
X3dnb25nQHF1aWNpbmMuY29tPgo+PiBJIHNvbWV0aW1lcyBzZWUgbmV3IHdhcm5pbmdzIHdpdGgg
dGhpcyBwYXRjaDoKPj4KPj4gW8KgIDE0Mi4zNDY0NzRdIGF0aDExa19wY2kgMDAwMDowNjowMC4w
OiBmYWlsZWQgdG8gZmx1c2ggbWdtdCB0cmFuc21pdCAKPj4gcXVldWUgMAo+PiBbwqAgMTQ3LjQ2
NjM2N10gYXRoMTFrX3BjaSAwMDAwOjA2OjAwLjA6IGZhaWxlZCB0byBmbHVzaCBtZ210IHRyYW5z
bWl0IAo+PiBxdWV1ZSAwCj4+Cj4+IEFuZCBtb3JlIGltcG9ydGFudGx5IHRoaXMgYnJlYWtzIHN1
c3BlbmQgb24gbXkgTlVDIHRlc3Rib3g6Cj4+Cj4+IFvCoCAxNzUuMTQxODIwXSBQTTogc3VzcGVu
ZCBlbnRyeSAoZGVlcCkKPj4gW8KgIDE3NS4xNTA1MTJdIEZpbGVzeXN0ZW1zIHN5bmM6IDAuMDA4
IHNlY29uZHMKPj4gW8KgIDE3NS4yMjk3MDNdIEZyZWV6aW5nIHVzZXIgc3BhY2UgcHJvY2Vzc2Vz
IC4uLiAoZWxhcHNlZCAwLjAwMyAKPj4gc2Vjb25kcykgZG9uZS4KPj4gW8KgIDE3NS4yMzM1MDZd
IE9PTSBraWxsZXIgZGlzYWJsZWQuCj4+IFvCoCAxNzUuMjMzNTg4XSBGcmVlemluZyByZW1haW5p
bmcgZnJlZXphYmxlIHRhc2tzIC4uLiAoZWxhcHNlZCAwLjAwMSAKPj4gc2Vjb25kcykgZG9uZS4K
Pj4gW8KgIDE3NS4yNDI0NTddIHByaW50azogU3VzcGVuZGluZyBjb25zb2xlKHMpICh1c2Ugbm9f
Y29uc29sZV9zdXNwZW5kIAo+PiB0byBkZWJ1ZykKPj4gW8KgIDE3NS4yNDUyNjldIHdsYW4wOiBk
ZWF1dGhlbnRpY2F0aW5nIGZyb20gMDA6MDM6N2Y6NDg6ODE6NTkgYnkgCj4+IGxvY2FsIGNob2lj
ZSAoUmVhc29uOiAzPURFQVVUSF9MRUFWSU5HKQo+PiBbwqAgMTc1LjI4NTg4MV0gZTEwMDBlOiBF
RUUgVFggTFBJIFRJTUVSOiAwMDAwMDAxMQo+PiBbwqAgMTgwLjc0NTI1OV0gYXRoMTFrX3BjaSAw
MDAwOjA2OjAwLjA6IGZhaWxlZCB0byBmbHVzaCBtZ210IHRyYW5zbWl0IAo+PiBxdWV1ZSAwCj4+
IFvCoCAxODUuODY0OTc3XSBhdGgxMWtfcGNpIDAwMDA6MDY6MDAuMDogZmFpbGVkIHRvIGZsdXNo
IG1nbXQgdHJhbnNtaXQgCj4+IHF1ZXVlIDAKPj4gW8KgIDE4NS45NzA2MDFdIFBNOiBTb21lIGRl
dmljZXMgZmFpbGVkIHRvIHN1c3BlbmQsIG9yIGVhcmx5IHdha2UgCj4+IGV2ZW50IGRldGVjdGVk
Cj4+IFvCoCAxODUuOTc0MDgxXSB1c2IgdXNiMzogcm9vdCBodWIgbG9zdCBwb3dlciBvciB3YXMg
cmVzZXQKPj4gW8KgIDE4NS45NzQxMzVdIHVzYiB1c2I0OiByb290IGh1YiBsb3N0IHBvd2VyIG9y
IHdhcyByZXNldAo+PiBbwqAgMTg2LjA5ODg3MF0gbnZtZSBudm1lMDogOC8wLzAgZGVmYXVsdC9y
ZWFkL3BvbGwgcXVldWVzCj4+IFvCoCAxODYuMjk3MDc3XSBPT00ga2lsbGVyIGVuYWJsZWQuCj4+
IFvCoCAxODYuMjk3MzYxXSBSZXN0YXJ0aW5nIHRhc2tzIC4uLiBkb25lLgo+PiBbwqAgMTg2LjM0
MzczM10gUE06IHN1c3BlbmQgZXhpdAo+Pgo+PiBNeSBzZXR1cDoKPj4KPj4gVGFnOsKgwqDCoCBh
dGgtMjAyMTExMjIxMTExCj4+Cj4+IFvCoCAxNTEuMTIzNzMyXSBhdGgxMWtfcGNpIDAwMDA6MDY6
MDAuMDogTVNJIHZlY3RvcnM6IDMyCj4+IFvCoCAxNTEuMTIzODUxXSBhdGgxMWtfcGNpIDAwMDA6
MDY6MDAuMDogcWNhNjM5MCBodzIuMAo+PiBbwqAgMTUxLjcyMDYxOF0gYXRoMTFrX3BjaSAwMDAw
OjA2OjAwLjA6IGNoaXBfaWQgMHgwIGNoaXBfZmFtaWx5IDB4YiAKPj4gYm9hcmRfaWQgMHhmZiBz
b2NfaWQgMHhmZmZmZmZmZgo+PiBbwqAgMTUxLjcyMDkxMl0gYXRoMTFrX3BjaSAwMDAwOjA2OjAw
LjA6IGZ3X3ZlcnNpb24gMHgxMDFjMDZjYyAKPj4gZndfYnVpbGRfdGltZXN0YW1wIDIwMjAtMDYt
MjQgMTk6NTAgZndfYnVpbGRfaWQKPj4KCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vYXRoMTFrCg==
