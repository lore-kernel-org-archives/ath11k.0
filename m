Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB669C369D0
	for <ath11k@archiver.kernel.org>; Wed, 25 Sep 2024 11:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:
	Cc:To:Subject:MIME-Version:Date:Message-ID:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tc8uqoCNRNdrD17ZB4QzB7ejHnXWxueD1dikRRayNIA=; b=qTkr1ivuzxkUFUGowMlz+id3wF
	o/RdQi5JdfB8HW2sU67WOj9ENCqgcjfO7KwP1lsKjX2OMNc8Pvgs8j2mt5XUD51QmHC7y7jO8znep
	EoJjxu7AL8W9LHUSIPI/bgnBCi4HzGGrnBGxEI+1VVYYj0YcNwrvX3k4XUL/7BBmtHzCROzgP/OAP
	1Bpwgl+7usSJvIJ6/oFK3uiGx95D+MfJHJgxUwGozwZucWHR4gkESbT5K0r0107+JAp/x2stSOZ4L
	215HfEIkVd65x62FfO8PNd0KvLdfshntX+Jsq/51re43WRv6kPm4wBw6eVaDTIj9n5bcFggkwno20
	zNE+J3sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stQGh-00000004szi-1vNY;
	Wed, 25 Sep 2024 11:33:15 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stQGe-00000004sz5-0onE
	for ath11k@lists.infradead.org;
	Wed, 25 Sep 2024 11:33:13 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-8324124a172so84864139f.2
        for <ath11k@lists.infradead.org>; Wed, 25 Sep 2024 04:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727263991; x=1727868791; darn=lists.infradead.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tc8uqoCNRNdrD17ZB4QzB7ejHnXWxueD1dikRRayNIA=;
        b=axU9wXbqx3blsrpZB0LFezYYjkFD2bVlrqGoqghpeOzk0B7ysLNzyclCVZWrwLweXy
         7K6PXArTz2Gu9F8LDmbb+cRPWKRDKdQqD0bV6/tnbTIkSiLB2mX/a5lmJgCam53lHV6D
         s/V4BP1UgQQLO/X4BYxLw9lXh7xgAvVeqn98vwKFLNiWqtpX6aAEhZkSbuQh/P77sYm5
         GerJRWRPVQHuJ6nLsAXXFTfuyFhllNxQZLitHvaxSLG1DUYh2aOuMN6jlqhF2+nAc+kH
         aAzQIvzdygGcUt/mcA7BRGRCBSNJTu+eFqHZaIvCsUqDKGBBraLPX2wgEEanc8xxVaa7
         A0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727263991; x=1727868791;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tc8uqoCNRNdrD17ZB4QzB7ejHnXWxueD1dikRRayNIA=;
        b=FNL9Sa/DoDOQligH5KNfTQpIMIZ8B82Wodxv4u/Oq/t10k9ZUs+0XNxJ7naWBTJVxa
         NViVWNh0UqRLJ6Gy2zbK/HiSESFGV5IlMpZnG/PxPyGQIlmL6IhK4MiEWMmx5/HQdO+4
         4F9N9mMc+SDq6tm1AVDDgJpGmgK1RJCnZu/IjuSibPDGK/ncQ+nTZRNCFhu8SKaNrvw6
         SC4GhX4omD6PjY20Ln7av3HuxMApejDmM2wB7/KIliBUzElF02MTglN+y2PKtdWqPYd/
         xc0EY1qtT+4mbrlXGio9yDUPEKRRzJvQhhIBKOTIlx0U8p/R2ONVRRgGwLG5iki70Gmk
         dBEw==
X-Gm-Message-State: AOJu0Yy+8quIj5xSGRBV8HoEic8GEPQZILYDIdlFsnXPZfrFiKmAzIvf
	c/3jlwQVYZy5kHVQiEsDOY+GzJ59nJG/X2kpnZ4jvLFWSDenbOoj
X-Google-Smtp-Source: AGHT+IHYHRWH8mBWxmgeETnntNhbzxDj98PIYcEbLrgqoXhejrC12/4mSvk/PAlAQKZ3evNhvlxTFA==
X-Received: by 2002:a05:6602:1694:b0:82d:3c2:9118 with SMTP id ca18e2360f4ac-83247f89baemr302888339f.16.1727263990549;
        Wed, 25 Sep 2024 04:33:10 -0700 (PDT)
Received: from [10.163.199.22] ([64.125.133.166])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4d40f0e92ddsm991918173.24.2024.09.25.04.33.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Sep 2024 04:33:09 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------VLjyUQCgADLx2t4IVYMshR58"
Message-ID: <0d1dab88-66a0-48c1-bdbe-777d07c3132e@gmail.com>
Date: Wed, 25 Sep 2024 04:33:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k/WCN6855 neighbor report request made immediately after
 connection gets no response (with MFP)
To: Baochen Qiang <quic_bqiang@quicinc.com>,
 "open list:MEDIATEK MT76 WIRELESS LAN DRIVER"
 <linux-wireless@vger.kernel.org>
Cc: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
References: <eb41d8ec-c4f1-474e-a938-099f27aa94e3@gmail.com>
 <fd90d471-503b-4f58-ae11-bae2afab08c7@quicinc.com>
Content-Language: en-US
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <fd90d471-503b-4f58-ae11-bae2afab08c7@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_043312_273645_DE8271E8 
X-CRM114-Status: GOOD (  22.97  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

This is a multi-part message in MIME format.
--------------VLjyUQCgADLx2t4IVYMshR58
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgQmFvY2hlbiwNCg0KT24gOS8yNS8yNCAzOjA3IEFNLCBCYW9jaGVuIFFpYW5nIHdyb3Rl
Og0KPg0KPiBPbiA5LzE5LzIwMjQgODoyMSBQTSwgSmFtZXMgUHJlc3R3b29kIHdyb3RlOg0K
Pj4gSGksDQo+Pg0KPj4gSSBub3RpY2VkIGFuIGlzc3VlIHdoZW4gd2Ugc3RhcnRlZCBwdXR0
aW5nIGF0aDExayBjbGllbnRzIG9uIGEgV1BBMyBuZXR3b3JrIHdoaWNoIHNlZW1zIHRvIGJl
IHJlbGF0ZWQgdG8gdGhlIGZhY3QgdGhhdCBtYW5hZ2VtZW50IGZyYW1lIHByb3RlY3Rpb24g
aXMgZW5hYmxlZCAod29ya3MgZmluZSBvbiBXUEEyIG5vIE1GUCkuIEltbWVkaWF0ZWx5IGFm
dGVyIGFuIGluaXRpYWwgYXNzb2NpYXRpb24gYSBuZWlnaGJvciByZXBvcnQgcmVxdWVzdCBn
b2VzIG91dCBhbmQgd2UgZ2V0IG5vIHJlc3BvbnNlIGZyb20gdGhlIEFQLiBBZnRlciBnZXR0
aW5nIGEgUENBUCBpbiBvbmUgY2FzZSB3ZSBub3RpY2VkIHRoZSBuZWlnaGJvciByZXBvcnQg
cmVxdWVzdCB3ZW50IG91dCB1bmVuY3J5cHRlZCwgdGhvdWdoIHN0aWxsIGhhZCB0aGUgQ0NN
UCBJViBwYXJhbWV0ZXIuIFRoZSBjb250ZW50IG9mIHRoZSByZXF1ZXN0IHdhcyB0aGUgdW5l
bmNyeXB0ZWQgcmVxdWVzdCwgYW5kIHNvbWV0aGluZyBsaWtlIDE1IGJ5dGVzIG9mIDB4MDAg
cGFkZGluZy4gSSB3aWxsIHNheSwgdGhpcyBpbml0aWFsIFBDQVAgd2FzIG1hZGUgdGhyb3Vn
aCB0aGUgQVAgdmVuZG9yIHNvIHBlcmhhcHMgaXQgYXV0b21hdGljYWxseSBhZGRlZCB0aGUg
cmlnaHQga2V5cyB0byBkZWNyeXB0IHRoZSBmcmFtZSwgdGhpcyBjb3VsZCBiZSBhIHJlZCBo
ZXJyaW5nLiBJIHRyaWVkIG9uIG15IGhvbWUgbmV0d29yayBhbmQgaXQgd2FzIGhpdCBvciBt
aXNzLCBzb21ldGltZXMgSSB3b3VsZCBnZXQgYSByZXNwb25zZSBidXQgc29tZXRpbWVzIEkg
d291bGRuJ3QsIGJ1dCBJIGRpZCBzZWUgdGhlIGZyYW1lIHdhcyBhbHdheXMgZW5jcnlwdGVk
IGluIG15IGhvbWUgbmV0d29yayBjYXNlIHRob3VnaCB3aGVuIGFkZGluZyB0aGUgUE1LIGRp
cmVjdGx5IGluIHdpcmVzaGFyayBJIGNvdWxkbid0IGRlY3J5cHQgaXQsIHdoZXJlIG9uIG90
aGVyIGhhcmR3YXJlIGxpa2UgaXdsd2lmaSBJIGNvdWxkLg0KPiBpcyB5b3VyIGhvbWUgbmV0
d29yayBhbHNvIFdQQTM/DQo+DQo+IGFuZCBob3cgZGlkIHlvdSBnZXQgdGhlIFBNSz8gaXMg
aXQgZ2VuZXJhdGVkIGJ5IElXRCBhbmQgcHJpbnRlZCBhcyBkZWJ1ZyBtZXNzYWdlPw0KDQpJ
IGFjdHVhbGx5IGhhZCB0byBtb2RpZnkgSVdEIHRvIHByaW50IG91dCB0aGUgUE1LIGFmdGVy
IGl0IGRlcml2ZWQgaXQuIA0KV1BBMyBtYWtlcyB0aGlzIGEgaHVnZSBwYWluIHNpbmNlIHRo
ZSBQTUsgZGlmZmVycyBiZXR3ZWVuIFNBRSBleGNoYW5nZXMuDQoNCkkndmUgYXR0YWNoZWQg
YW4gSVdEIGRpZmYgdGhhdCBwcmludHMgb3V0IHRoZSBQTUssIHdoaWNoIGNhbiBiZSBhZGRl
ZCB0byANCndpcmVzaGFyayBpZiB0aGF0IGhlbHBzLg0KDQo+DQo+PiBTb21lIHRpbWUgYWZ0
ZXIgdGhlIGNvbm5lY3Rpb24gbmVpZ2hib3IgcmVwb3J0cyB3b3JrIGZpbmUuIEknbSBub3Qg
c3VyZSBvZiBhIHRpbWUgZnJhbWUgb3IgZGVsYXkgcmVxdWlyZWQgdGhhdCBnZXRzIHRoZW0g
d29ya2luZywgYnV0IGl0IG1ha2VzIG1lIHN1c3BlY3QgdGhhdCBhdGgxMWsgZG9lc24ndCBo
YXZlIHRoZSBrZXlzIGZ1bGx5IGFkZGVkIGluIHRoZSBmaXJtd2FyZSBiZWZvcmUgdXNlcnNw
YWNlIGdldHMgc2lnbmFsZWQgYXMgImNvbm5lY3RlZCIuIFJ1bm5pbmcgdGhlIHNhbWUgc2Nl
bmFyaW8gb24gYXRoMTBrIG9yIGl3bHdpZmkgaGFzIG5vIGlzc3Vlcy4gVGhpcyBuZWlnaGJv
ciByZXBvcnQgcmVxdWVzdCBpbW1lZGlhdGVseSBhZnRlciBjb25uZWN0aW5nIGlzIElXRCdz
IGRlZmF1bHQgYmVoYXZpb3IsIHNvIGl0cyByZWxhdGl2ZWx5IGVhc3kgdG8gdGVzdCBieSBq
dXN0IHJlc3RhcnRpbmcgSVdELg0KPiBJIGNhcHR1cmVkIGEgV1BBMyBTQUUgUENBUCB0b28s
IGJ1dCBvbmx5IGNhbiBmaW5kIHNvbWUgdW5lbmNyeXB0ZWQgQUREQkEgcmVxL3Jlc3AgZnJh
bWVzLiBmb3IgdGhvc2UgZW5jcnlwdGVkIGFjdGlvbiBmcmFtZXMgSSBhbSBzdGlsbCBzdHJ1
Z2dsaW5nIHRvIGRlY3J5cHQgdGhlbQ0KPg0KPj4gU2luY2UgdGhlIG5laWdoYm9yIHJlcG9y
dHMgd29yayBmaW5lIGFmdGVyIHNvbWUgdGltZSBpdHMgbm90IHJlYWxseSBhIGNyaXRpY2Fs
IGlzc3VlIGJ1dCBJIHdhbnRlZCB0byBicmluZyBpdCB1cCBqdXN0IGluIGNhc2UuDQo+Pg0K
Pj4gVGhhbmtzLA0KPj4NCj4+IEphbWVzDQo+Pg0K
--------------VLjyUQCgADLx2t4IVYMshR58
Content-Type: text/x-patch; charset=UTF-8; name="print-pmk.patch"
Content-Disposition: attachment; filename="print-pmk.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL3NyYy9zYWUuYyBiL3NyYy9zYWUuYwppbmRleCA5N2MwYWYwNS4uZjJj
ZWJlMDkgMTAwNjQ0Ci0tLSBhL3NyYy9zYWUuYworKysgYi9zcmMvc2FlLmMKQEAgLTg1Nyw2
ICs4NTcsMjAgQEAgc3RhdGljIGJvb2wgc2FlX3ZlcmlmeV9jb25maXJtKHN0cnVjdCBzYWVf
c20gKnNtLCBjb25zdCB1aW50OF90ICpmcmFtZSkKICAgICAgICByZXR1cm4gdHJ1ZTsKIH0K
IAorI2luY2x1ZGUgPHN0ZGlvLmg+CisKK3N0YXRpYyB2b2lkIHByaW50X3Btayh1aW50OF90
ICpwbWspCit7CisgICAgICAgdW5zaWduZWQgaW50IGk7CisKKyAgICAgICBwcmludGYoIlBN
SzogIik7CisKKyAgICAgICBmb3IgKGkgPSAwOyBpIDwgMzI7IGkrKykKKyAgICAgICAgICAg
ICAgIHByaW50ZigiJTAyeCIsIHBta1tpXSk7CisKKyAgICAgICBwcmludGYoIlxuIik7Cit9
CisKIHN0YXRpYyBpbnQgc2FlX3Byb2Nlc3NfY29uZmlybShzdHJ1Y3Qgc2FlX3NtICpzbSwg
Y29uc3QgdWludDhfdCAqZnJvbSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBj
b25zdCB1aW50OF90ICpmcmFtZSwgc2l6ZV90IGxlbikKIHsKQEAgLTg4MCw2ICs4OTQsOCBA
QCBzdGF0aWMgaW50IHNhZV9wcm9jZXNzX2NvbmZpcm0oc3RydWN0IHNhZV9zbSAqc20sIGNv
bnN0IHVpbnQ4X3QgKmZyb20sCiAgICAgICAgaGFuZHNoYWtlX3N0YXRlX3NldF9wbWtpZChz
bS0+aGFuZHNoYWtlLCBzbS0+cG1raWQpOwogICAgICAgIGhhbmRzaGFrZV9zdGF0ZV9zZXRf
cG1rKHNtLT5oYW5kc2hha2UsIHNtLT5wbWssIDMyKTsKIAorICAgICAgIHByaW50X3Btayhz
bS0+cG1rKTsKKwogICAgICAgIHNtLT5zdGF0ZSA9IFNBRV9TVEFURV9BQ0NFUFRFRDsKIAog
ICAgICAgIGlmICghc20tPmhhbmRzaGFrZS0+YXV0aGVudGljYXRvcikgewoK

--------------VLjyUQCgADLx2t4IVYMshR58--

