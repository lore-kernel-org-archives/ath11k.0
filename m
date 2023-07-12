Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC41EB64D9
	for <ath11k@archiver.kernel.org>; Wed, 12 Jul 2023 08:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pTl1Fi7bRPTj9LBgqy8eOkVPOFbrrMHja0oWN5T0kIc=; b=vijcjUOrthq6AO
	kIHVWm/Cus7zZTvrG0l4tudF18dMmbmk3GT3rTin9Y+yX3mOI5CLIF6xIXZf6vzyEcVlbHoCH6nsI
	5NPs62K5/PS5mBxrwndsN4zHuSHBECkfwsKuFveyrGRs9oLLdBAtMcL3ZodNRhHejJvhMX/eOZViM
	pfPc/q2v66mVzMoUgGgLghGLDRGYJwV8dF8voEtslktnpf1bpoJQ4yxZfpoL3srDh/Gxk8RpCS7wu
	WWK2ckMr//ZwdKFYTtppZ8m9Yop3Jmr51OLB/Qai6lSy6OPwPEuy23yHhDW7mR4MGu2Pd3WOf9RBo
	4vVRlmUdt6xyIou5BayQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJVMY-00GvyR-2I;
	Wed, 12 Jul 2023 08:38:18 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJVMV-00Gvw7-0A
	for ath11k@lists.infradead.org;
	Wed, 12 Jul 2023 08:38:17 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-51dec0b6fecso8484011a12.1
        for <ath11k@lists.infradead.org>; Wed, 12 Jul 2023 01:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=squaremind-io.20221208.gappssmtp.com; s=20221208; t=1689151089; x=1691743089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JwCizXSduRCXP+Rj6MgXBcIOIDagya4LEoqez6CL88U=;
        b=v1nH54Cc5esjiYKsXu9BTeRiW2hJDftU4SEcEbofkFAE5a/3yr1st7w9L3fAOLwGHI
         2eQfmdo3nzGzZrAZrXrgt9rP5keNHPFodzhPnzfkfJSOVe4qBlJNS+5a1pn+kZ5/UwEH
         HIvYLtt/t7U0bxLdvqo0bh/2jcZ+afkF3ujjvW1uUGcEvaOR6WIof0+ytaqSAolR7M5h
         ImrfVR6dVz8iMknSUCMunJRtVvpFDmOTBKBvf4QWz3wJsavdPwwOvqFE87SrGO8U20+M
         +zlFT5DLB3x8BdyUxTEaPslDIfTVAs8ckDg+tq7LSy5WTbYU2pqFVKxZ5FryMIkzXTjk
         NFLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689151089; x=1691743089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JwCizXSduRCXP+Rj6MgXBcIOIDagya4LEoqez6CL88U=;
        b=DZJRrB6iweidpEcdRQ92SbBkh80Ui9nB4HvDJeZVvS8px9d0gnnEJYYrWdXmduvAP/
         3U7CeBgva9hEmybF7HnBTWFu78fc70hDFCDA6/f2MyNlwmXqL538117E7VE6dY+Np9tJ
         SEve/lLbLoz2+b8n9rr9CYvFZFUrTWT01fytHmAylLW3laiqYS1rVtOUUReKHmCuoq3z
         XJS1pMzk4kYSpfkbXsqR6gQ2BTihXbRWzLJm9Es1MolnV9I60ItwY9GTWvXCv1KwrN8H
         OzaaLoliisThXKXKhAo+QAXSv6Qspp/IYa3CbfmwgfGy4+sjd8+hYerhzHYK2va81F5x
         34pg==
X-Gm-Message-State: ABy/qLaC94aBSl7UNSXzVdmGNZRWS523blPoOaStwfi7zQ8ZA8OM3byx
	6bVa6Nk/7jaEHXmYpJJwu5B7wD5oyTV6yp4SDoSNUVwtmQcDm6Lr5uYEUQ==
X-Google-Smtp-Source: APBJJlGaXbPwVGE1PhIBVnvWyIH5KbOgUmAxqR7VsnksDu4jhMDz4Je9lxoT8NLJYP0SNgLIXfhEK5quEfyIncKCQjQ=
X-Received: by 2002:aa7:d349:0:b0:51e:16ae:b6d7 with SMTP id
 m9-20020aa7d349000000b0051e16aeb6d7mr16634882edr.33.1689151089403; Wed, 12
 Jul 2023 01:38:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAPr+0Hb5b_CEihVH+Mo-uR4+Wp-ACkoCySkyLrk=mkzme6ezPg@mail.gmail.com>
 <87sf9v7xir.fsf@kernel.org> <CAPr+0HbwpA0KrV71ah8bQ_Gnn9Ch2PMZnHE3uqRUrNU8=DoMFA@mail.gmail.com>
 <87jzv696zv.fsf@kernel.org>
In-Reply-To: <87jzv696zv.fsf@kernel.org>
From: Tanguy Serrat <tanguy@squaremind.io>
Date: Wed, 12 Jul 2023 10:37:58 +0200
Message-ID: <CAPr+0HbBEXXqTJ7Hv3cfKBB=rtZ+tq4Xn_YVLxsNz=kbn3b=Ww@mail.gmail.com>
Subject: Re: ath11k: QCN9074: low HE-MCS index
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_013815_276974_823C96FF 
X-CRM114-Status: GOOD (  16.34  )
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

PiBUaGFua3MgZm9yIGZpbGluZyB0aGUgcmVwb3J0LCB3ZSB3aWxsIGxvb2sgYXQgYnVnICMyMTc2
NTIgYW5kIGdldCBiYWNrCj4gdG8geW91LiBCdXQgZG8gbm90ZSB0aGF0IHRoaXMgd2lsbCBtb3N0
IGxpa2VseSB0YWtlIHNvbWUgdGltZSwgb3VyCj4gYmFja2xvZyBpcyBsb25nIGFuZCBwZW9wbGUg
YXJlIGFsc28gdGFraW5nIHZhY2F0aW9ucy4gSSBqdXN0IGNhbWUgYmFjawo+IHllc3RlcmRheSBh
bmQgSSdtIGhvcGluZyB0byB0YWtlIG1vcmUgdmFjYXRpb24gbGF0ZXIgdGhpcyBtb250aC4KCkR1
bHkgbm90ZWQsIHRoYW5rIHlvdS4gSSBob3BlIHlvdSBhbmQgeW91ciB0ZWFtIHdpbGwgaGF2ZSBh
IGdvb2QgYnJlYWsuCgpXZSd2ZSBzcGVudCAxNTArIGhvdXJzIHdvcmtpbmcgb24gYmFja3BvcnRp
bmcgYW5kIGdldHRpbmcgb3VyIFFDTjkwNzQgdG8gd29yay4KV2Ugd291bGQgYmUgZXh0cmVtZWx5
IGdyYXRlZnVsIGlmIHlvdSBndXlzIGNhbiBoZWxwIHVzIHB1dCB0aGlzCm1pbGVzdG9uZSBiZWhp
bmQsIHNvIHRoYXQgd2UgY2FuIG1vdmUgZm9yd2FyZCBpbiB0aGUgZGV2ZWxvcG1lbnQgb2YKb3Vy
IG1lZGljYWwgcHJvZHVjdCBhbmQgYmUgb24gdGltZSBmb3Igb3VyIFJhZGlvIGNlcnRpZmljYXRp
b24uCgpMZSBtYXIuIDExIGp1aWwuIDIwMjMgw6AgMTA6MzksIEthbGxlIFZhbG8gPGt2YWxvQGtl
cm5lbC5vcmc+IGEgw6ljcml0IDoKPgo+IFRhbmd1eSBTZXJyYXQgPHRhbmd1eUBzcXVhcmVtaW5k
LmlvPiB3cml0ZXM6Cj4KPiA+IERlYXIgS2FsbGUsCj4gPgo+ID4gVGhhbmsgeW91IGZvciB5b3Vy
IHJlcGx5Lgo+ID4KPiA+IEkgaGF2ZSBvcGVuZWQgdHdvIHNlcGFyYXRlIGlzc3VlczoKPiA+IDEp
IGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjE3NTM2IC0gcmVs
YXRlZCB0byBhCj4gPiBwcmV2aW91cyBpc3N1ZSBJIGVuY291bnRlcmVkLgo+ID4KPiA+IDIpIGh0
dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjE3NjUyIC0gcmVsYXRl
ZCB0byB0aGlzIGZlZWQuCj4gPgo+ID4gSSBoYXZlIHRlc3RlZCAzbSBhcGFydCwgYXMgZGVzY3Jp
YmVkIGluIDIxNzY1MiwgcmVzdWx0cyBhcmUganVzdAo+ID4gc2xpZ2h0bHkgYmV0dGVyIGluIHRl
cm1zIG9mIHJlcG9ydGVkIE1DUy4gSSBzdGlsbCBzZWVtIHRvIGJlIG1pc3NpbmcKPiA+IGFsbCBj
YXBhYmlsaXRpZXMgb3ZlciA3LiBJIGhhdmUgYXR0YWNoZWQgdGhlIGZ1bGwgZG1lc2cgbG9nIGFu
ZAo+ID4gLmNvbmZpZyBmaWxlIHRvIHRoZSBidWcgcmVwb3J0Cj4KPiBUaGFua3MgZm9yIGZpbGlu
ZyB0aGUgcmVwb3J0LCB3ZSB3aWxsIGxvb2sgYXQgYnVnICMyMTc2NTIgYW5kIGdldCBiYWNrCj4g
dG8geW91LiBCdXQgZG8gbm90ZSB0aGF0IHRoaXMgd2lsbCBtb3N0IGxpa2VseSB0YWtlIHNvbWUg
dGltZSwgb3VyCj4gYmFja2xvZyBpcyBsb25nIGFuZCBwZW9wbGUgYXJlIGFsc28gdGFraW5nIHZh
Y2F0aW9ucy4gSSBqdXN0IGNhbWUgYmFjawo+IHllc3RlcmRheSBhbmQgSSdtIGhvcGluZyB0byB0
YWtlIG1vcmUgdmFjYXRpb24gbGF0ZXIgdGhpcyBtb250aC4KPgo+IC0tCj4gaHR0cHM6Ly9wYXRj
aHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXdpcmVsZXNzL2xpc3QvCj4KPiBodHRwczov
L3dpcmVsZXNzLndpa2kua2VybmVsLm9yZy9lbi9kZXZlbG9wZXJzL2RvY3VtZW50YXRpb24vc3Vi
bWl0dGluZ3BhdGNoZXMKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRo
MTFrCg==
