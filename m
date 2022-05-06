Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77861C433EF
	for <ath11k@archiver.kernel.org>; Fri,  6 May 2022 01:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ALlY6JV+u9ujR+7pdjI+kRLP0RoqqfX+NBuQ26rF5ng=; b=Y9oHLJb50aNAUG
	4pLeKdBbvcoc44YkjoPA81/mvpiDJxwrK2ynIxjWCDO1fgTJp8musvVSRO1qLlWufVLB3BaCpN0oP
	RR16pxpLnC7S6FlpRhPC/iZnUJaJBmxFm/K0bWYJh132i9vNQL/4jew2iw2tgOBdxnTqbqWRsQGp0
	Qg+PhN7O16Yh4OrfBOIsdyicOTmXxLVtABQd5cgZ7MrtrVdT8LWyHT+ynPTG9nUZDD5AROL3rhZKl
	Zuat2OqZINDkLz53BERejIIakDJzySf0T7H5zQpkkKIdaUvAw8EsIpR3aajJTG9bxnM7e1BIWuFrH
	QK6veiEKDcOSQX4pL17w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmmi9-000mJu-Te; Fri, 06 May 2022 01:24:49 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmmi7-000mJQ-VS
 for ath11k@lists.infradead.org; Fri, 06 May 2022 01:24:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651800288; x=1683336288;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ZAyW46bDt1XyBpp4qIIkQWPnxgGn42ujUL/CEZ0UftA=;
 b=yP4yYxnEp8310tBNjJ8To5ajOEugIPHau9kbCTD2zTKUKkNgRQ6HL4M8
 I2d3NSxqDhp+J74zBp0aho7PRuaO1d27ukwruFnNjKoXY/TXCjc5P8rDv
 7/YBRWx5d4Z0vvv7sBpxokL7UbA4SB6gL0FrWerVgFwsEVEZ+NSB6jxOb M=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 05 May 2022 18:24:46 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 18:24:46 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 5 May 2022 18:24:45 -0700
Received: from [10.253.34.102] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 5 May 2022
 18:24:44 -0700
Message-ID: <699e4be8-f32e-7cc7-4c38-3c321334245f@quicinc.com>
Date: Fri, 6 May 2022 09:24:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] ath11k: Handle keepalive during wowlan suspend and resume
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20220505014657.1549947-1-quic_bqiang@quicinc.com>
 <f270b2fb-a1c4-9c6b-6eda-c2d0a8c8c190@quicinc.com>
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <f270b2fb-a1c4-9c6b-6eda-c2d0a8c8c190@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_182448_093107_B42EE8F9 
X-CRM114-Status: GOOD (  11.78  )
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

Ck9uIDUvNi8yMDIyIDM6MDQgQU0sIEplZmYgSm9obnNvbiB3cm90ZToKPiBPbiA1LzQvMjAyMiA2
OjQ2IFBNLCBCYW9jaGVuIFFpYW5nIHdyb3RlOgo+PiBXaXRoIHdvd2xhbiBlbmFibGVkIGFuZCBh
ZnRlciBzbGVlcGluZyBmb3IgYSByYXRoZXIgbG9uZyB0aW1lLAo+Cj4gbml0OiBzL3dvd2xhbi9X
b1dMQU4vIHRvIGNvbmZvcm0gdG8gY29tbW9uIHVzYWdlIChhbHNvIGluIHN1YmplY3QpCj4KYWxy
ZWFkeSBmaXhlZCBpbiB2Mi4KCgo+PiB3ZSBhcmUgc2VlaW5nIHRoYXQgd2l0aCBzb21lIEFQcywg
aXQgaXMgbm90IGFibGUgdG8gd2FrZSB1cAo+PiB0aGUgU1RBIHRob3VnaCB0aGUgY29ycmVjdCB3
YWtlIHVwIHBhdHRlcm4gaGFzIGJlZW4gY29uZmlndXJlZC4KPj4gVGhpcyBpcyBiZWNhdXNlIHRo
ZSBob3N0IGRvZXNuJ3Qgc2VuZCBrZWVwYWxpdmUgY29tbWFuZCB0bwo+PiBmaXJtd2FyZSwgdGh1
cyBmaXJtd2FyZSB3aWxsIG5vdCBzZW5kIGFueSBwYWNrZXQgdG8gdGhlIEFQIGFuZAo+PiBhZnRl
ciBhIHNwZWNpZmljIHRpbWUgdGhlIEFQIGtpY2tzIG91dCB0aGUgRFVULgo+Pgo+PiBGaXggdGhp
cyBpc3N1ZSBieSBlbmFibGluZyBrZWVwYWxpdmUgYmVmb3JlIGdvaW5nIHRvIHN1c3BlbmQKPj4g
YW5kIGRpc2FibGluZyBpdCBhZnRlciByZXN1bWUgYmFjay4KPj4KPj4gVGVzdGVkLW9uOiBXQ042
ODU1IGh3Mi4wIFBDSSAKPj4gV0xBTi5IU1AuMS4xLTAxNzIwLjEtUUNBSFNQU1dQTF9WMV9WMl9T
SUxJQ09OWl9MSVRFLTEKPj4KPj4gU2lnbmVkLW9mZi1ieTogQmFvY2hlbiBRaWFuZyA8cXVpY19i
cWlhbmdAcXVpY2luYy5jb20+Cj4+IC0tLQo+Cj4gWy4uLl0KPgo+PiArCj4+ICtlbnVtIHdtaV9z
dGFfa2VlcGFsaXZlX21ldGhvZCB7Cj4+ICvCoMKgwqAgV01JX1NUQV9LRUVQQUxJVkVfTUVUSE9E
X05VTExfRlJBTUUgPSAxLCAvKiA4MDIuMTEgTlVMTCBmcmFtZSAqLwo+PiArwqDCoMKgIFdNSV9T
VEFfS0VFUEFMSVZFX01FVEhPRF9VTlNPTElDSVRFRF9BUlBfUkVTUE9OU0UgPSAyLCAvKiBBUlAg
Cj4+IHJlc3BvbnNlICovCj4+ICvCoMKgwqAgV01JX1NUQV9LRUVQQUxJVkVfTUVUSE9EX0VUSEVS
TkVUX0xPT1BCQUNLID0gMywgLypFVEhFUk5FVCAKPj4gTE9PUEJBQ0sqLwo+PiArwqDCoMKgIFdN
SV9TVEFfS0VFUEFMSVZFX01FVEhPRF9HUkFUVUlUT1VTX0FSUF9SRVFVRVNUID0gNCwgLyogCj4+
IGdyYXR1aXRvdXMgQVJQIHJlcSovCj4KPiBuaXQ6IGZvciB0aGUgdHdvIGFib3ZlIGNvbnNpc3Rl
bnRseSBoYXZlIHNwYWNlIHNlcGFyYXRpbmcgY29tbWVudCBmcm9tIAo+IC8qIGFuZCAqLwo+CnN1
cmUsIHdpbGwgYWRkcmVzcyBpbiB2My4KCgo+PiArIFdNSV9TVEFfS0VFUEFMSVZFX01FVEhPRF9N
R01UX1ZFTkRPUl9BQ1RJT04gPSA1LCAvKiB2ZW5kb3IgYWN0aW9uIAo+PiBmcmFtZSAqLwo+PiAr
fTsKPiBbLi4uXQoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
