Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E27C433F5
	for <ath11k@archiver.kernel.org>; Fri, 26 Nov 2021 15:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FCjBv9cAwc2S5K2+Vr/RqI+9YIRWGjT3befKvfQgE5g=; b=peTULEtCL3c8zu1rt+V9oEQrE3
	jUBFN9OEAALy41EaCxaBjOv+dqVJahKhtH/7IIAlOU4CoRyGy0jEG+2qLubezL7yShwJSjOCDbPjN
	3hnKT9tBdidC556A+p5aqYnQcPJHj8X6lCiewgSu/F3e71CqzL0jhox3ELAZCkOJ/epqy5muxDJrx
	1HyvjNj7+5ll1gkyDp2JQ3mWc7lunxqKqxhtcSqIpiBHaWXA4tZQSH4HEGuxf2trLx9sTO9bwWS1j
	v+OsiEumaHV5FLgyrF8/HHxNdFDNANFRecaojYsPDxzcddODcSQnq7eBHfxqPxPYP+isiE6NUqvWI
	1F4qWMog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqdZZ-00B2iI-H9; Fri, 26 Nov 2021 15:55:37 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqdZW-00B2hV-Tr
 for ath11k@lists.infradead.org; Fri, 26 Nov 2021 15:55:36 +0000
Received: by mail-lf1-x12b.google.com with SMTP id c32so25385403lfv.4
 for <ath11k@lists.infradead.org>; Fri, 26 Nov 2021 07:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=rtiEsz0yu8XkSOFsF65caP+MO5fDQ7PkY/VasdH0S0o=;
 b=Fi1aYVUCTMJLuu5+pg4Z+8wqAfBoYNmWtjrYZS0QgM/JGIBfrvzMIqwhJqYRCS5fPT
 xoQST12f5YpZPEcW2Gf7FUmqjQxdajD6tNybnnbLbI3WHqInX18yFkRte7SJd2Rp0SQD
 CuNPM9hQU0karpHkl8lywX3oNO6jnv1HPXzIdDRQ8QCoyu34Y/JYwmXeUE+U8O4INSZX
 zMFutUg/lO1mf5wQoDUwkbLhsdWeGai4+exZJKvddxObCc1fIWVBWnk1PEQDQV1CIg0i
 3BMVSwhuwZ7edIz/p+cAOragWpwFeiO9f4X/26QlD7n8+FA2/qM5qWqgy1wH2wm3tbs0
 CnpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=rtiEsz0yu8XkSOFsF65caP+MO5fDQ7PkY/VasdH0S0o=;
 b=d4agEHlJ9l3A37CnZJp2tcX5nFYB0OAbOQ6SlFedd1oBGRGFs+/TdwVcHYjfhIUDmu
 gP1+nIssw98EJPeVuCRuTSXsSdcr48LsiMnUwPCHBalf6fFedmcyB1wGaJ9tMYmyRKjl
 FbJFJ3b2qpkCtHhEaYXu1a7C5jrIQqNgFSrNbGl5Sd8vqz0j7FfGMhGPv7OIq1IgR2Cs
 vuXp2JfBQWD1MJRyvyOHf1klqDWMv+DiFoFVAPZL1dOAHpjIB2nx+JxdxubX8vRyCFKi
 Cpn9V8/7B2PaPZPDyeTefKA+3CPnGnGl4rS4VsmEC+nAr4WtBnzWwXrlf9XUIXzzbjkG
 vhcA==
X-Gm-Message-State: AOAM532xQAfPGeNfPkKjNHrIrns/uwtT+A4dXe5UVDYkiLWIw9pf8dY9
 QvXPyB+saAHLiK0DIXUfPhA=
X-Google-Smtp-Source: ABdhPJyO8k5H1lFvYmQIrTzseXJxSijGEvKCtoekt41+bjazqWng+y92tvFwzU+WyS/2IzqJsrubjw==
X-Received: by 2002:a05:6512:3e2a:: with SMTP id
 i42mr30673512lfv.77.1637942132086; 
 Fri, 26 Nov 2021 07:55:32 -0800 (PST)
Received: from [192.168.8.100] ([176.59.55.141])
 by smtp.gmail.com with ESMTPSA id z23sm539088ljn.23.2021.11.26.07.55.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Nov 2021 07:55:31 -0800 (PST)
Subject: Re: ath11k: QCN9074: Incompatible board-2.bin for 6GHz
To: John Crispin <john@phrozen.org>, Sven Eckelmann <sven@narfation.org>,
 ath11k@lists.infradead.org, Lavanya Suresh <lavaks@codeaurora.org>
Cc: kvalo@codeaurora.org
References: <2091899.pNsEtq2SQc@ripper>
 <4c778b39-3c32-2b7c-9f91-4aba49fbe4ca@phrozen.org>
From: Mark Herbert <mark.herbert42@gmail.com>
Message-ID: <45a609a1-60ce-4f14-3008-3daf8be75247@gmail.com>
Date: Fri, 26 Nov 2021 18:55:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <4c778b39-3c32-2b7c-9f91-4aba49fbe4ca@phrozen.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_075534_990330_0CE8A49E 
X-CRM114-Status: GOOD (  14.83  )
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

V2lsbCB0aGVyZSBiZSBhIG5ldyBGVyBmb3IgUUNBNjM5MD/CoCBJdCBzZWVtcyB0byBiZSB0aGUg
bW9zdCBvdXRkYXRlZCBpbiAKS2FsbGUncyByZXBvIDooCgpPbiAyNi4xMS4yMDIxIDE3OjU0LCBK
b2huIENyaXNwaW4gd3JvdGU6Cj4KPgo+IE9uIDI2LjExLjIxIDExOjUyLCBTdmVuIEVja2VsbWFu
biB3cm90ZToKPj4gSSBmb3VuZCBvdXQgdGhhdCB0aGlzIGlzIGFjdHVhbGx5IGNhdXNlZCBieSB0
aGUgQkRGLiBJZiBJJ3ZlIAo+PiBleHRyYWN0ZWQgdGhlCj4+IGJvYXJkLmJpbiBmcm9tIHRoZSBU
SVAgYm9hcmQtMi5iaW4gWzNdICh3aGljaCBzZWVtcyB0byBjb21lIGZyb20gdGhlIFFDQQo+PiBB
VEguMTEuNCBDUyByZWxlYXNlKS4gV2l0aCB0aGlzIHZlcnNpb24sIGl0IHNlZW1zIHRvIHdvcmsg
ZmluZS4gSSAKPj4gaGF2ZW4ndCB5ZXQKPj4gZm91bmQgb3V0IHdoYXQgdGhlIHJlbGV2YW50IGNo
YW5nZSBpcyAtIGJ1dCBpZiBzb21lb25lIGhhcyBoaW50cyB0aGVuIAo+PiB0aGlzCj4+IHdvdWxk
IGNvdWxkIGJlIGludGVyZXN0aW5nIGZvciBvdGhlciBkZXZpY2VzIHdoaWNoIHNob3VsZCBiZSBh
ZGRlZCB0byAKPj4gdGhpbmdzCj4+IGxpa2UgT3BlbldydC4KPgo+IEthbGxlJ3MgcmVwbyBpcyBv
dXRkYXRlZCBieSBzZXZlcmFsIHJlbGVhc2VzLiBUaGlzIGlzIHRoZSBuZXcgdXBzdHJlYW0gCj4g
cmVwby4KPgo+IHRoZSBlcnJvciB5b3UgYXJlIHNlZWluZyBpcyBhbiBBQkkgYnJlYWthZ2UgYmV0
d2VlbiBwcmUvcG9zdCBzZnAxMS40IAo+IGZ3L2JkZi4gdXNpbmcgYSBmdyA+PSAyLjUueCByZXF1
aXJlcyBhIEJERiBnZW5lcmF0ZWQgd2l0aCAvIGRlcnZpY2VkIAo+IGZyb20gPj0gc2ZwMTEuNAo+
Cj4gdGhlIEJERnMgaW5zaWRlIHRoZSBUSVAgcmVwbyBjb21lIGZyb20gaGVyZQo+IC0tPiBodHRw
czovL2dpdGh1Yi5jb20vcXVpYy91cHN0cmVhbS13aWZpLWZ3Lwo+Cj4gwqDCoMKgwqBKb2huCj4K
Ci0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
