Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B099C4332F
	for <ath11k@archiver.kernel.org>; Mon,  7 Nov 2022 11:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2z8ACTYR2KRblHwEfbo54Mrpcyc36lnr2PSNJE+2aQM=; b=owQQRISls9LVCl
	r0rrkdAOPRje/IN5so+mj62TEY+fcszYEQSiyAcHc+7Ymnnd0xnf+iE/ONFuc1t5m2Ddsx910x2px
	QY18u7r3NjEksvSjDvFombpVRChjn5u76MVdmnnvs4i7JUeRKUwimg2YIDXOqQ0e9X3ZJgxgx+FpA
	e3cqUOTK8OtNnveqIR+SG7GOd3R6t/GDvP2a1L/Bu1cE79xatF9dqWBxnPZNe9ddrs5kjfkElyHOb
	/h02THHu/ZthbqRefIQc7WUCHUyO/XpcrLg9xyaM46H/NS4f/+Hf2BMXoZM7YkRVP0ZJkRZ54rO0R
	8fGr9yN4z4PIeNPmEj9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os0MS-00EA9w-0d; Mon, 07 Nov 2022 11:32:16 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os0MP-00EA7g-6X
	for ath11k@lists.infradead.org; Mon, 07 Nov 2022 11:32:14 +0000
Received: by mail-pg1-x532.google.com with SMTP id 78so10175221pgb.13
        for <ath11k@lists.infradead.org>; Mon, 07 Nov 2022 03:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mwsOXXbcfC9fPjVivpon0nxUnv1iu8M1E4VwDE036so=;
        b=HwjEbCai0XhnP/RUIQarlE9bfsmBkDgCqDCOF5dUFqyYssiqdFn8MvDkPr1Q0XQ1Pj
         CeEer3BdC00JYtah1OgHhWFD7FEeXIdTHqCNq/l5B5WtDmLbwvFTSEJh5WOMZqIfZ254
         hIr1csj6KbkARIBEnmh7fNWIBxQZ9uXtlo/ONmYvdv8MlS2SzlyCP6fzFQ++AxnZHbJ1
         Bw9hbjjKguoWE1dJIKht/T48yspuYjguQp12lk1TYz6b/UxuPuHk0h6y52HksR4TMHg9
         ROwX96Tc2xwh7oVG7i/4rwPqek693EFnOuBPV9qtSRchs+6Ahsp/sda91TD8n5p40iv4
         w/QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mwsOXXbcfC9fPjVivpon0nxUnv1iu8M1E4VwDE036so=;
        b=HJNP7M8wa3SjkJjLUNe1qgY/r/jaGURWodIivwUVVq59N2k+8kFMcCXjaVMgoMYcHO
         IejYB3uMtVPD9MVvpgKLiOmDj9eddHO0CzQVfadPqFB4Ria/Dh2Ys/GyYYOZbQSoX0Rp
         2NQZdYWrQYaDY0yIpjSkHZJv3l6croayiw0nLoGPJ+hK9/wBoASyEPiQz3tFTGP4bh9V
         ihm9eEDtQ9/cqOcLiKOhdFh9RIfykBeppBhXIssBxYmcRw5Sp0ld/lnU56QkXV7/Fuxd
         pIe2QLcYY2X+KPo8al6LgAAewIENbKSQRbmE2i6K5umBlMyYRt2hXf1aPS5V6mlKUgMV
         1LRA==
X-Gm-Message-State: ACrzQf3ajfYGMM8BnKFJ5B5++x3ZJRtL6E6D7Vkv5hlpLFn3uKYXKBQt
	Qsvnn5oWB7f7hzV2AAASdY9mmVHY1xUH39SiXJU=
X-Google-Smtp-Source: AMsMyM7zwf8phIoE3ww8OFA5vj88vgpNeKkyhY1W/vxSrjcVmEPM/kkmNqbqDSDVIIKqQtBpzLIFVgqddNs2chqqWS0=
X-Received: by 2002:a63:f801:0:b0:46f:fe3f:ea87 with SMTP id
 n1-20020a63f801000000b0046ffe3fea87mr26347950pgh.10.1667820728974; Mon, 07
 Nov 2022 03:32:08 -0800 (PST)
MIME-Version: 1.0
References: <20221105194943.826847-1-robimarko@gmail.com> <20221107112756.GB2220@thinkpad>
In-Reply-To: <20221107112756.GB2220@thinkpad>
From: Robert Marko <robimarko@gmail.com>
Date: Mon, 7 Nov 2022 12:31:57 +0100
Message-ID: <CAOX2RU6mVCRNobsPDrzpmHqf=KY57GaG4VCruNBfLa8sucydiA@mail.gmail.com>
Subject: Re: [PATCH 1/2] bus: mhi: core: add SBL state callback
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: kvalo@kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, gregkh@linuxfoundation.org, 
	elder@linaro.org, hemantk@codeaurora.org, quic_jhugo@quicinc.com, 
	quic_qianyu@quicinc.com, bbhatt@codeaurora.org, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, ath11k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org, ansuelsmth@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_033213_281621_6EF5F196 
X-CRM114-Status: GOOD (  23.08  )
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

T24gTW9uLCA3IE5vdiAyMDIyIGF0IDEyOjI4LCBNYW5pdmFubmFuIFNhZGhhc2l2YW0gPG1hbmlA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBTYXQsIE5vdiAwNSwgMjAyMiBhdCAwODo0OTo0MlBN
ICswMTAwLCBSb2JlcnQgTWFya28gd3JvdGU6Cj4gPiBBZGQgc3VwcG9ydCBmb3IgU0JMIHN0YXRl
IGNhbGxiYWNrIGluIE1ISSBjb3JlLgo+ID4KPiA+IEl0IGlzIHJlcXVpcmVkIGZvciBhdGgxMWsg
TUhJIGRldmljZXMgaW4gb3JkZXIgdG8gYmUgYWJsZSB0byBzZXQgUVJUUgo+ID4gaW5zdGFuY2Ug
SUQgaW4gdGhlIFNCTCBzdGF0ZSBzbyB0aGF0IFFSVFIgaW5zdGFuY2UgSUQtcyBkb250IGNvbmZs
aWN0IGluCj4gPiBjYXNlIG9mIG11bHRpcGxlIFBDSS9NSEkgY2FyZHMgb3IgQUhCICsgUENJL01I
SSBjYXJkLgo+ID4gU2V0dGluZyBRUlRSIGluc3RhbmNlIElEIGlzIG9ubHkgcG9zc2libGUgaW4g
U0JMIHN0YXRlIGFuZCB0aGVyZSBpcwo+ID4gY3VycmVudGx5IG5vIHdheSB0byBlbnN1cmUgdGhh
dCB3ZSBhcmUgaW4gdGhhdCBzdGF0ZSwgc28gcHJvdmlkZSBhCj4gPiBjYWxsYmFjayB0aGF0IHRo
ZSBjb250cm9sbGVyIGNhbiB0cmlnZ2VyIG9mZi4KPiA+Cj4KPiBXaGVyZSBjYW4gSSBmaW5kIHRo
ZSBjb3JyZXNwb25kaW5nIGF0aDExayBwYXRjaCB0aGF0IG1ha2VzIHVzZSBvZiB0aGlzCj4gY2Fs
bGJhY2s/CgpIaSBNYW5pLAphdGgxMWsgcGF0Y2ggd2FzIHNlbnQgYXMgcGFydCBvZiB0aGUgc2Ft
ZSBzZXJpZXMgdG8gZXZlcnlib2R5IGluY2x1ZGVkCmluIHRoaXMgcGF0Y2ggYXMgd2VsbAp1bmRl
ciB0aGUgbmFtZSBvZiAiW1BBVENIIDIvMl0gd2lmaTogYXRoMTFrOiB1c2UgdW5pcXVlIFFSVFIg
aW5zdGFuY2UgSUQiLgoKSWYgeW91IGRpZCBub3QgcmVjZWl2ZSBpdCBkdWUgdG8gc29tZSBraW5k
IG9mIGVycm9yLCBpdHMgYXZhaWxhYmxlIGF0CnRoZSBsaW51eC13aXJlbGVzcyBwYXRjaHdvcmtb
MV0Kb3IgYXRoMTFrIG1haWxpbmcgbGlzdFsyXS4KClsxXSBodHRwczovL3BhdGNod29yay5rZXJu
ZWwub3JnL3Byb2plY3QvbGludXgtd2lyZWxlc3MvcGF0Y2gvMjAyMjExMDUxOTQ5NDMuODI2ODQ3
LTItcm9iaW1hcmtvQGdtYWlsLmNvbS8KWzJdIGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL3Bp
cGVybWFpbC9hdGgxMWsvMjAyMi1Ob3ZlbWJlci8wMDM2NzguaHRtbAoKUmVnYXJkcywKUm9iZXJ0
Cgo+Cj4gVGhhbmtzLAo+IE1hbmkKPgo+ID4gU2lnbmVkLW9mZi1ieTogUm9iZXJ0IE1hcmtvIDxy
b2JpbWFya29AZ21haWwuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9idXMvbWhpL2hvc3QvbWFp
bi5jIHwgMSArCj4gPiAgaW5jbHVkZS9saW51eC9taGkuaCAgICAgICAgIHwgMiArKwo+ID4gIDIg
ZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvYnVzL21oaS9ob3N0L21haW4uYyBiL2RyaXZlcnMvYnVzL21oaS9ob3N0L21haW4uYwo+ID4g
aW5kZXggZGYwZmJmZWU3Yjc4Li44YjAzZGQxZjBjYjggMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJz
L2J1cy9taGkvaG9zdC9tYWluLmMKPiA+ICsrKyBiL2RyaXZlcnMvYnVzL21oaS9ob3N0L21haW4u
Ywo+ID4gQEAgLTkwMCw2ICs5MDAsNyBAQCBpbnQgbWhpX3Byb2Nlc3NfY3RybF9ldl9yaW5nKHN0
cnVjdCBtaGlfY29udHJvbGxlciAqbWhpX2NudHJsLAo+ID4gICAgICAgICAgICAgICAgICAgICAg
IHN3aXRjaCAoZXZlbnQpIHsKPiA+ICAgICAgICAgICAgICAgICAgICAgICBjYXNlIE1ISV9FRV9T
Qkw6Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdCA9IERFVl9TVF9UUkFOU0lU
SU9OX1NCTDsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1oaV9jbnRybC0+c3Rh
dHVzX2NiKG1oaV9jbnRybCwgTUhJX0NCX0VFX1NCTF9NT0RFKTsKPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gICAgICAgICAgICAgICAgICAgICAgIGNhc2UgTUhJ
X0VFX1dGVzoKPiA+ICAgICAgICAgICAgICAgICAgICAgICBjYXNlIE1ISV9FRV9BTVNTOgo+ID4g
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbWhpLmggYi9pbmNsdWRlL2xpbnV4L21oaS5oCj4g
PiBpbmRleCBhNTQ0MWFkMzNjNzQuLmJlZmZlMTAyZGQxOSAxMDA2NDQKPiA+IC0tLSBhL2luY2x1
ZGUvbGludXgvbWhpLmgKPiA+ICsrKyBiL2luY2x1ZGUvbGludXgvbWhpLmgKPiA+IEBAIC0zNCw2
ICszNCw3IEBAIHN0cnVjdCBtaGlfYnVmX2luZm87Cj4gPiAgICogQE1ISV9DQl9TWVNfRVJST1I6
IE1ISSBkZXZpY2UgZW50ZXJlZCBlcnJvciBzdGF0ZSAobWF5IHJlY292ZXIpCj4gPiAgICogQE1I
SV9DQl9GQVRBTF9FUlJPUjogTUhJIGRldmljZSBlbnRlcmVkIGZhdGFsIGVycm9yIHN0YXRlCj4g
PiAgICogQE1ISV9DQl9CV19SRVE6IFJlY2VpdmVkIGEgYmFuZHdpZHRoIHN3aXRjaCByZXF1ZXN0
IGZyb20gZGV2aWNlCj4gPiArICogQE1ISV9DQl9FRV9TQkxfTU9ERTogTUhJIGRldmljZSBlbnRl
cmVkIFNCTCBtb2RlCj4gPiAgICovCj4gPiAgZW51bSBtaGlfY2FsbGJhY2sgewo+ID4gICAgICAg
TUhJX0NCX0lETEUsCj4gPiBAQCAtNDUsNiArNDYsNyBAQCBlbnVtIG1oaV9jYWxsYmFjayB7Cj4g
PiAgICAgICBNSElfQ0JfU1lTX0VSUk9SLAo+ID4gICAgICAgTUhJX0NCX0ZBVEFMX0VSUk9SLAo+
ID4gICAgICAgTUhJX0NCX0JXX1JFUSwKPiA+ICsgICAgIE1ISV9DQl9FRV9TQkxfTU9ERSwKPiA+
ICB9Owo+ID4KPiA+ICAvKioKPiA+IC0tCj4gPiAyLjM4LjEKPiA+Cj4KPiAtLQo+IOCuruCuo+Cu
v+CuteCuo+CvjeCuo+CuqeCvjSDgrprgrqTgrr7grprgrr/grrXgrq7gr40KCi0tIAphdGgxMWsg
bWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
