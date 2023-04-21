Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B735C77B73
	for <ath11k@archiver.kernel.org>; Fri, 21 Apr 2023 01:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MZgYoH3T4Xndb4iC+V6wpVHBTq4aa6KzftxYktY57XY=; b=46nRfz0Vh3+mSJ
	sytZDJkIul3ETaL1tyDzel5ujIoWwNF9K6xRNJFAdIMMd9+WXqrR66i82YpBYiTeBnzKzZl6S0Sz6
	UaF/BhrfYYGy6ZxZY5/JUkQcUFqBoLbOT9eaGlhgw6+66wY49TTlHALir6lvEevrTitpLkEt5dlZr
	Leo9ALhzz6xRnzldvtEAfGY+vNVKbpyOxyciQat7oR2ItkwWQ2viOGpcZjjgkHKdWBM+sZa80+L6T
	wrukiqD9RqDXKp1emr6v+4aXyJ5UCVvYn8shyhlpKngZvZgDr7jXyLZ1f3/YtDAmjWfm+y+c6ggCT
	uEG9zhVfPjG4wQls8vQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppfgk-009OPU-2T;
	Fri, 21 Apr 2023 01:35:50 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppfgj-009OOx-0I
	for ath11k@lists.infradead.org;
	Fri, 21 Apr 2023 01:35:50 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-94a34a0b9e2so131898066b.1
        for <ath11k@lists.infradead.org>; Thu, 20 Apr 2023 18:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682040947; x=1684632947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NAuouLcqr0ejtxe1AJw4cQCm6LeEd95tjcFXAUo30uc=;
        b=KceSX6G8dDh0Ws08Haar67YsWPm6Q4KENSIFtttl+kGXIP074MxD5b6qFoTHOuqC9r
         A1HLVkOZAGc1SOvwPhPXRRMZ1fUEemruPSy2AnpNtW+VkdSCR0YHMwfkfceGnwPN3/J7
         uivGWQu8Pc9SD9TEWEBbZSd/KTMG7ijpDiZ0YSY5zWlci2xc7ExfYhakJGQJTUbGc6mv
         lqNjKZf8VVk+GuU/OpWMqy8NwJlNypANNUYqDpwAHPD3duJkZDF415tiJ7foSzeGGyWh
         5MtRjbeXCM5G0C44Av2iXGyJZyHqXu1e8I3VLqduF0JNhJf6Rid9oFyf9cfHBoZoauEk
         B5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682040947; x=1684632947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NAuouLcqr0ejtxe1AJw4cQCm6LeEd95tjcFXAUo30uc=;
        b=L8lHIqYJ2QBtTsTwyb6/5UXN8NXwHXL1ZzL4KenLD4SNEiQ9clxBhaw9JSPKRMOe6o
         nAB1Vcy7VkX33udDr6f9VQWAjDBLBlSi3D0o9Pr5GkxxEvWCaInSAUY9dvsV+ZHL4EHD
         OwZKGfLTVPeUan83a5vO5uk1fNilHvtcgqP0kT0MidiwlgWzHxI+wo/0is7w032dZGqw
         EeIgFfAQuWrnHBeInEMWtGfJZDt3pVHWrQuVtuhbld7W0/pGUfvqjH0Rob0L1U1UNIN5
         JenY0tk0hBWjuFWn+sMOYMC57wP2UYozCNs/AEMJ70DJ7m6QK178XmeqkjucQVldUZOS
         dejg==
X-Gm-Message-State: AAQBX9c+YnQ+F+Pr1m7pzZp58l4DIIlEWV3amFI1bN14NQV032/ErFY0
	gUaHWTI7QHkgI3rhC2MKMjQ8P/2D6M7gSOrkfT/Pvvft+E26aA==
X-Google-Smtp-Source: AKy350Z0BT/Khur+n4RfSTFHrflmeanrBkPtF3L5RlXNDFxyzRNTgKrGY5H2F4CThb9wtedqOJGXo6zDaXLRR6cJXxE=
X-Received: by 2002:a17:906:c281:b0:94f:680d:3437 with SMTP id
 r1-20020a170906c28100b0094f680d3437mr738871ejz.17.1682040946564; Thu, 20 Apr
 2023 18:35:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAG0V13RiyW0HptSbZ6vxoTCmdjzrYZ9MQxCqKuiczJL9znW0-g@mail.gmail.com>
 <87mt32vjdm.fsf@kernel.org>
In-Reply-To: <87mt32vjdm.fsf@kernel.org>
From: Doug Brewer <brewer.doug@gmail.com>
Date: Fri, 21 Apr 2023 09:35:34 +0800
Message-ID: <CAG0V13SNRwhyyKMBxL71-u5mGH6kiagXecebage7xqCq7N3q3w@mail.gmail.com>
Subject: Re: QCA9074 problem on rk3568
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_183549_135697_E1EC9961 
X-CRM114-Status: GOOD (  11.29  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBBcHIgMjAsIDIwMjMgYXQgODoxNuKAr1BNIEthbGxlIFZhbG8gPGt2YWxvQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gRG91ZyBCcmV3ZXIgPGJyZXdlci5kb3VnQGdtYWlsLmNvbT4gd3Jp
dGVzOgo+Cj4gPiBJIHRyaWVkIHRvIGluc3RhbGwgbGludXgga2VybmVsIDYuMy1yYzcgb24gbXkg
cmszNTY4IGV2Yi4gIEl0IHNlZW1zIHRoZXJlJ3MKPiA+IGEgcHJvYmxlbSBhYm91dCBNSEk6Cj4g
Pgo+ID4gWyAgIDExLjM0MDU1OF0gYXRoMTFrX3BjaSAwMDAyOjAxOjAwLjA6IEJBUiAwOiBhc3Np
Z25lZCBbbWVtIDB4MzgwMDAwMDAwLTB4MzgwMWYKPiA+IGZmZmYgNjRiaXRdCj4gPiBbICAgMTEu
MzQxMzk5XSBhdGgxMWtfcGNpIDAwMDI6MDE6MDAuMDogZW5hYmxpbmcgZGV2aWNlICgwMDAwIC0+
IDAwMDIpCj4gPiBbICAgMTEuNDIyODQ5XSBhdGgxMWtfcGNpIDAwMDI6MDE6MDAuMDogTVNJIHZl
Y3RvcnM6IDE2Cj4gPiBbICAgMTEuNDIzMzM1XSBhdGgxMWtfcGNpIDAwMDI6MDE6MDAuMDogcWNu
OTA3NCBodzEuMAo+ID4gWyAgIDExLjY2MDg0Nl0gbWhpIG1oaTA6IFJlcXVlc3RlZCB0byBwb3dl
ciBPTgo+ID4gWyAgIDExLjY2MTI3MV0gbWhpIG1oaTA6IFBvd2VyIG9uIHNldHVwIHN1Y2Nlc3MK
PiA+IFsgICAzMS43MTYyODldIG1oaSBtaGkwOiBNSEkgZGlkIG5vdCBsb2FkIGltYWdlIG92ZXIg
QkhJLCByZXQ6IC01Cj4gPiBbICAgNjAuNTUxOTQyXSBtaGkgbWhpMDogRGV2aWNlIGZhaWxlZCB0
byBlbnRlciBSRUFEWSBzdGF0ZQo+ID4gWyAgIDYwLjU1MjU0NF0gbWhpIG1oaTA6IEVycm9yIG1v
dmluZyBmcm9tIFBNIHN0YXRlOiBGaXJtd2FyZSBEb3dubG9hZCBFcnJvciB0bzoKPiA+IERJU0FC
TEUKPiA+IFsgICA2MC41NTMzNzZdIGF0aDExa19wY2kgMDAwMjowMTowMC4wOiBmYWlsZWQgdG8g
cG93ZXIgdXAgbWhpOiAtMTEwCj4gPiBbICAgNjAuNTUzOTcyXSBhdGgxMWtfcGNpIDAwMDI6MDE6
MDAuMDogZmFpbGVkIHRvIHN0YXJ0IG1oaTogLTExMAo+ID4gWyAgIDYwLjU1NDUzMl0gYXRoMTFr
X3BjaSAwMDAyOjAxOjAwLjA6IGZhaWxlZCB0byBwb3dlciB1cCA6LTExMAo+ID4gWyAgIDYwLjU2
NzkwN10gYXRoMTFrX3BjaSAwMDAyOjAxOjAwLjA6IGZhaWxlZCB0byBjcmVhdGUgc29jIGNvcmU6
Cj4gPiAtMTEwCj4gPiBbICAgNjAuNTY4NDg4XSBhdGgxMWtfcGNpIDAwMDI6MDE6MDAuMDogZmFp
bGVkIHRvIGluaXQgY29yZTogLTExMAo+ID4KPiA+IEFueSBpZGVhIGhvdyB0byBmaXggaXQ/ICBU
aGFua3MuCj4KPiBJIHdvdWxkIGZpcnN0IGNoZWNrIHRoYXQgdGhlIGZpcm13YXJlIGZpbGVzIGFy
ZSBub3QgY29ycnVwdGVkLgoKIyBzaGEyNTZzdW0gYW1zcy5iaW4gYm9hcmQtMi5iaW4gbTMuYmlu
CjVlZTFiN2IyMDQ1NDFiNWY5OTk4NGYyMWQ2OTRlY2VjYWVjMDhmYmNlMWI1MjBmZmU2ZmU3NDBi
MDJhNGFmZDcgIGFtc3MuYmluCmRiZjBjYTE0YWExMjI5ZWNjZDQ4ZjI2ZjEwMjY5MDFiOTcxOGIx
NDNiZDMwYjUxYjhlYTY3Yzg0YmE2MjA3ZjEgIGJvYXJkLTIuYmluCmI2ZDk1N2YzMzUwNzNhMTVh
OGRlODA5Mzk4ZTE1MDZmMDIwMGEwODc0N2VhZjcxODljODQzY2Y1MTlmZmMxZGUgIG0zLmJpbgoK
VGhlIGZpcm13YXJlIGZpbGVzIGxvb2sgZ29vZCwgdGhhbmtzLgoKLSBEb3VnCgotLSAKYXRoMTFr
IG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
