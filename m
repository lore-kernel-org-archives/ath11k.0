Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 520C2C433EF
	for <ath11k@archiver.kernel.org>; Tue, 15 Feb 2022 13:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dmsdut28uVhW3MsgJzsopcGAwG738Kr2ezRLApvyuKU=; b=FQF0GvKHt/xx1X
	cwvPOYvEpekj3vKi0OpyTCamB5GoPuJ7Bp2vsI6P4uJr2FAD3idH5THwCjNllGJ1j5arOtuE76Bvz
	XrtraTDCGQ7mz+YRULzoMdmKBVd4colZqqdHLNhyPkInINVCLK6mBXzB91hlK5TuBsl/bwzbgqgIP
	KSWGag7UZvC7mhOD8PYnj2PoFeTj5nAabtPSgOGXmYLIW1RKMZIrf0b4aA3WfpbEjFHAH/IxyROL4
	Be2qPX0xqDpdMdLsmANSjWp+4B7SvELn7xu7wvEqeBndbqS9VMvELKNcZSrJWf4w0Q4RPR4BFRzPm
	DHdrkqjn/UT8kSCinuGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJxV6-002lI1-A9; Tue, 15 Feb 2022 13:04:12 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJxV2-002lGt-Qa
 for ath11k@lists.infradead.org; Tue, 15 Feb 2022 13:04:10 +0000
Received: by mail-yb1-xb33.google.com with SMTP id y6so55730145ybc.5
 for <ath11k@lists.infradead.org>; Tue, 15 Feb 2022 05:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=E3TtJm0/pIELnfZsvEWUd8MJegX94A5wwk804NLGuPQ=;
 b=k3ySxKVyqIemx82Y6uPiNxqWAD9zJeayBHXIIxd1FYVt3CdNHiCKCwJylcJXEUa2AP
 JCa7w7zx+qS6Vh/c/FO1GuzDlH5+fj+JZA1rvu9NDG4NuPcohOqgHmMtSUNUPhz/tkDg
 b831HX8hx7h5L/5+MtdZjfgu4y3jdY0zJB6s6toLecgFjNyywDh8naCcJHVDjrCaG0AG
 PtdVWrn3R8WPGAxfn+BJT0Lh/XGnu1JX+4pqbyXXnhBPIH2ImCbDYR7TvxfN1Q/2kZOJ
 zxbZ1GsBy1bu8bWghFAi9HEsUGbGTKMPm2GMKWUCYCAnSREuydWpwDcQ4flkN6VV5xis
 Jbsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=E3TtJm0/pIELnfZsvEWUd8MJegX94A5wwk804NLGuPQ=;
 b=tYLhOOCpKfLBDKkyTftlK9q8j/HZ6/D0k2+NxKXqaM144wzYs4bUtFNQtJ9gvHkSR3
 qyy0nJNvFPu9K/9Cogm5W7WB/5XFUPKL3z4Mw7AcGMPmt12nzyXXWvRD9GmYtUEz7MC3
 pSyHUXiD2Besag959bdPRAFlgcf8qr7w6acz7YWRbzU0ltD6YJCaHILihU6qp9Vje5U3
 wBZRLYfN/LE0YH6LKgZbkhopkhFp9Vzn2SbLE/z4twHBB+D9ikM9LY27xl70OdL2n1ki
 QPgVdtTI2fxGeQpUtYlkJhy+aQ1bOyHGtIrCridlFx1pJhwntzBzB4meORw/4L71SA1D
 Fcbg==
X-Gm-Message-State: AOAM531q7s15FDE2eLYoCiGCNqhsYLr/MfZvHMG4YltYntHj9NMXfC78
 M+QNCARzg9GReiaPoZ9HfeUNh8O3RxwaYo/wGfU=
X-Google-Smtp-Source: ABdhPJxY6jjEpIfv41Zgl+p78yXsxUvRVpZBS1lhp/EqxcXTU8NPior3t4LAaZCiBlj83Ipv8kvbE1ihP+mJcKp2ZeU=
X-Received: by 2002:a25:ada2:: with SMTP id z34mr3730205ybi.628.1644930246960; 
 Tue, 15 Feb 2022 05:04:06 -0800 (PST)
MIME-Version: 1.0
References: <CAGYwnb=p38NMpWY=wLiPRE7eUDfjE_SyNS9zQ9W7Nhpy6hn+WQ@mail.gmail.com>
 <CAGYwnbnBjaNmS7aaSTXKtAbF1tKqeXTT_6tjka=5AS97c7Br8Q@mail.gmail.com>
 <87ilu5jr98.fsf@kernel.org> <198d5223-0dcf-6006-407f-7f9eeeb90c92@gmail.com>
 <CAGYwnbkh=RebRnSxXy7jXyfgMUXd=VBBZPTCB2zWbAM5y40XzQ@mail.gmail.com>
 <a00b83f2-ceba-ec6c-dd41-edaa9f84a041@gmail.com>
 <CAGYwnbnJb_0B0rwbDkTseJVZvNxn_XN2dPF5rG_ni9Hoy8MXgw@mail.gmail.com>
 <87ee4ocgfq.fsf@tynnyri.adurom.net>
 <CAGYwnbk9mUim8GvzLYqqkHLNjtJdQUMqhP1+82s3tCnRHRam=w@mail.gmail.com>
 <87o8381e6x.fsf@kernel.org>
In-Reply-To: <87o8381e6x.fsf@kernel.org>
From: Patricio Ferraggi Ares <pattferraggi@gmail.com>
Date: Tue, 15 Feb 2022 14:03:31 +0100
Message-ID: <CAGYwnbkLheu-d-AnKy7aN_zACKnRw8AgiBg6iBCys2cYQqiV5w@mail.gmail.com>
Subject: Re: Fwd: AX500 support quirks
To: Kalle Valo <kvalo@kernel.org>
Cc: Mark Herbert <mark.herbert42@gmail.com>, ath11k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_050408_901690_B7DBB848 
X-CRM114-Status: GOOD (  21.69  )
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

SGkgS2FsbGUsCgpXZWxsIGJ1dCBJIGRvbid0IHJlYWxseSBuZWVkIGluZm8gb24gaG93IHRvIGJ1
aWxkIHRoZSBrZXJuZWwsIEkgY2FuCmdldCB0aGF0IGZyb20gdGhlIGFyY2ggZG9jcyBhcyB5b3Ug
cG9pbnRlZCBvdXQuCldoYXQgSSBkbyBuZWVkIGlzIGluZm9ybWF0aW9uIG9uIGhvdyBzaG91bGQg
SSBpbmNsdWRlIHlvdXIgbGF0ZXN0CmNoYW5nZXMgb24gdGhlIGF0aDExayBhbmQgZnJvbSBNYXJr
IHdoaWNoIG1vZHVsZXMgaGUgaW5jbHVkZWQgd2hpbGUKYnVpbGRpbmcgaGlzIGtlcm5lbCB0byBn
ZXQgQmx1ZXRvb3RoLgoKQmFzaWNhbGx5IGFueXRoaW5nIHRoYXQgaXMgc3BlY2lmaWMgdG8gdGhl
IGRlbGwgeHBzIDkzMTAKCkJ1aWxkaW5nIHRoZSBrZXJuZWwgd2l0aCB0aGUgZGVmYXVsdCBhcmNo
IGNvbmZpZ3VyYXRpb24gd291bGQgbWFrZSBubwpkaWZmZXJlbmNlIGluIHRlcm1zIG9mIGhhcmR3
YXJlIHN1cHBvcnQuCgpFbCBtYXIsIDE1IGZlYiAyMDIyIGEgbGEocykgMTM6NTYsIEthbGxlIFZh
bG8gKGt2YWxvQGtlcm5lbC5vcmcpIGVzY3JpYmnDszoKPgo+IFBhdHJpY2lvIEZlcnJhZ2dpIEFy
ZXMgPHBhdHRmZXJyYWdnaUBnbWFpbC5jb20+IHdyaXRlczoKPgo+ID4gSGV5IGZvbGtzLAo+ID4K
PiA+IFNvLiBJIGFtIHN0aWxsIHVzaW5nIGFyY2ggbGludXgsIGJ1dCBub3QgZXZlcnl0aGluZyBp
cyB3b3JraW5nLgo+ID4gSSBoYXZlIGRlY2lkZWQgdG8gZ2l2ZSBpdCBhIHRyeSBhbmQgZGl2ZSBk
ZWVwZXIgYnkgdHJ5aW5nIHRvIGNvbXBpbGUKPiA+IG15IG93biBrZXJuZWwgd2l0aCB0aGUgbmVj
ZXNzYXJ5IG1vZHVsZXMgYW5kIGZpcm13YXJlIGZvciBXaWZpIGFuZAo+ID4gQmx1ZXRvb3RoLgo+
ID4KPiA+IENvdWxkIHlvdSBndXlzIHNoYXJlIHdpdGggbWUgd2hpY2ggcmVwb3MgKGFwYXJ0IGZy
b20gdGhlIGtlcm5lbAo+ID4gc291cmNlKSBJIHNob3VsZCB1c2UgaW4gb3JkZXIgdG8gYnVpbGQg
c29tZXRoaW5nIGJhc2VkIG9uIHRoZSBsYXRlc3QKPiA+IGxpbnV4LW1haW5saW5lIGtlcm5lbD8K
PiA+IEkgYW0gdW5hd2FyZSBvZiBob3cgc2hvdWxkIEkgaW5jbHVkZSB0aGUgbGF0ZXN0IGF0aDEx
ayBkcml2ZXJzIGZyb20KPiA+IEthbGxlIGFuZCB3aGljaCBtb2R1bGVzIEkgbmVlZCBpbiBvcmRl
ciB0byBtYWtlIEJUIHdvcmsuCj4gPiBJIHdvdWxkIHJlYWxseSBhcHByZWNpYXRlIGl0IGlmIHlv
dSBjb3VsZCBnaXZlIG1lIHNvbWUgbGlua3MgdG8gdGhlCj4gPiByZXBvcywgc29tZSBpbmZvLCBh
bmQgbWF5YmUgYSBiYXNpYyBzdHJhdGVneSBvbiBob3cgdG8gYXBwcm9hY2ggdGhpcy4KPiA+IEkg
d2lsbCBzZWFyY2ggYW5kIGxlYXJuIGZyb20gdGhhdCBzdGFydGluZyBwb2ludC4KPgo+IEFyY2gg
d2lraSBpcyBhIGdyZWF0IHNvdXJjZSBmb3IgaW5mb3JtYXRpb246Cj4KPiBodHRwczovL3dpa2ku
YXJjaGxpbnV4Lm9yZy90aXRsZS9rZXJuZWwKPgo+IEFyY2ggc2VlbXMgdG8gaGF2ZSBhIGxpbnV4
LW1haW5saW5lIHBhY2thZ2U6Cj4KPiBodHRwczovL2F1ci5hcmNobGludXgub3JnL3BhY2thZ2Vz
L2xpbnV4LW1haW5saW5lCj4KPiBCdXQgcXVlc3Rpb25zIGFib3V0IGNvbXBpbGluZyB0aGUga2Vy
bmVsIHNob3VsZCBiZSBzZW50IHRvIGRpc3Rybwo+IHN1cHBvcnQgY2hhbm5lbHMgYXMgdGhleSBr
bm93IGJlc3QgaG93IHRoZWlyIGRpc3RybyB3b3Jrcywgbm90IHRvIGF0aDExawo+IGxpc3QuCj4K
PiAtLQo+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC13aXJlbGVz
cy9saXN0Lwo+Cj4gaHR0cHM6Ly93aXJlbGVzcy53aWtpLmtlcm5lbC5vcmcvZW4vZGV2ZWxvcGVy
cy9kb2N1bWVudGF0aW9uL3N1Ym1pdHRpbmdwYXRjaGVzCgotLSAKYXRoMTFrIG1haWxpbmcgbGlz
dAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
