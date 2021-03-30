Return-Path: <SRS0=ucx4=I4=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0A20C433DB
	for <ath11k@archiver.kernel.org>; Tue, 30 Mar 2021 09:01:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 766386198A
	for <ath11k@archiver.kernel.org>; Tue, 30 Mar 2021 09:01:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 766386198A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8rcwq6IizpywpmgZChs7BFCdhNvm081/uzahh9rSVZs=; b=iwplJaPxJoOiDqEM+HgMoD4Ya
	Ft1nsrPMHVe+XAISbTbRfEFrGPI6k2FyXNQNxr2V52LdXx1W0PrL/FZVALek05j+zQisNrBSpxCvJ
	MJ6gMNbAvqkrQwYljp9wjjhBiKPW6zFk7SFGTy/iWOsBEXP58UqBr5G3DmZiFulAT+fu4ttmW/Pfg
	y2hA6/YFZr3jST2f2mJBMMMnfLNw5tKe5Jp3qmB4Ozd2SqkRiE4s09UgTWeyeZn6WnS7wyAU+bJU5
	JfnHCBVVizB48C8AKngNzolPA5xAsXF/875HTUzeLOF1E19NWtCs3hsHfqOArtdJ2rV0wgW0nU8g6
	xk90eViyg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRAFB-0037dN-PC; Tue, 30 Mar 2021 09:01:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRAF5-0037YI-11; Tue, 30 Mar 2021 09:00:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5F8DC619AA;
 Tue, 30 Mar 2021 09:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617094851;
 bh=7BKJpJRJJea7jWMl80W5EN9UAj8omc2Cs2r3GAQepzo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Wsuslf1aShoCKyVO6hEvzEdZFMLQDIu2sbrH3x69Zj3fzv+Ssz4//dpuMEbWngOUq
 Zjq5v+sm416E8eDL5lOizTzEa7Erwc/f8fCuW75qsYfDXgJ3oE6b4i2kQYeYtPZd4I
 FK+fITjA3iXC63XWANkkhj4NvYlqDfeUjJbbuVDoJnM3Z/9egQRLEp8Koxo3BlExlm
 KJf0GkZPfII5XV5fPTrpbDnwtlOxinHOG65Ikgkmm49iP6nf4qHit/q0d/LnVY5qb5
 qa+2M5n3XKCJv1Wm+mrJgHL5nAHA2YFzyo0MHv0A+yCW12hqtwqifDnY1PrNFQltR4
 2Y+g7lZslykhg==
Received: by mail-oo1-f45.google.com with SMTP id
 x187-20020a4a41c40000b02901b664cf3220so3609811ooa.10; 
 Tue, 30 Mar 2021 02:00:51 -0700 (PDT)
X-Gm-Message-State: AOAM533nppnCV3/ohHBMPyefH4zamp2tF9GM0CWt4YZbbI9CfnYpA0LF
 8VT+19QDcMgowOl8wd0UnJGUwHLDe9ZAhzYOkEA=
X-Google-Smtp-Source: ABdhPJzpNNBXFi0zlX+fSlV+iQuwxA7n7pfSwfoGiIinCD5YA1YpFSD4jDETbIF3gyjCIllkPcG9Qx+cRKe7U+THggk=
X-Received: by 2002:a4a:304a:: with SMTP id z10mr25148861ooz.26.1617094850520; 
 Tue, 30 Mar 2021 02:00:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210322160253.4032422-1-arnd@kernel.org>
 <20210322160253.4032422-7-arnd@kernel.org>
 <YGLkPjSBdgpriC0E@blackbook>
In-Reply-To: <YGLkPjSBdgpriC0E@blackbook>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 30 Mar 2021 11:00:36 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3nUCGwPpE+E820DniY8Haz1Xx72pA38P6s5MWsbi0iAQ@mail.gmail.com>
Message-ID: <CAK8P3a3nUCGwPpE+E820DniY8Haz1Xx72pA38P6s5MWsbi0iAQ@mail.gmail.com>
Subject: Re: [PATCH 06/11] cgroup: fix -Wzero-length-bounds warnings
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Martin Sebor <msebor@gcc.gnu.org>, 
 Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>, 
 Johannes Weiner <hannes@cmpxchg.org>,
 "the arch/x86 maintainers" <x86@kernel.org>, Ning Sun <ning.sun@intel.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, Kalle Valo <kvalo@codeaurora.org>, 
 Simon Kelley <simon@thekelleys.org.uk>, James Smart <james.smart@broadcom.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Anders Larsen <al@alarsen.net>,
 Serge Hallyn <serge@hallyn.com>, Imre Deak <imre.deak@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 tboot-devel@lists.sourceforge.net, 
 Intel Graphics <intel-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, ath11k@lists.infradead.org, 
 linux-wireless <linux-wireless@vger.kernel.org>,
 Networking <netdev@vger.kernel.org>, 
 linux-scsi <linux-scsi@vger.kernel.org>, Cgroups <cgroups@vger.kernel.org>, 
 LSM List <linux-security-module@vger.kernel.org>, Roman Gushchin <guro@fb.com>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Alexei Starovoitov <ast@kernel.org>, 
 Andrii Nakryiko <andriin@fb.com>, Odin Ugedal <odin@uged.al>,
 Cong Wang <xiyou.wangcong@gmail.com>, 
 Bhaskar Chowdhury <unixbhaskar@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_100055_762000_63FF97C6 
X-CRM114-Status: GOOD (  16.01  )
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

T24gVHVlLCBNYXIgMzAsIDIwMjEgYXQgMTA6NDEgQU0gTWljaGFsIEtvdXRuw70gPG1rb3V0bnlA
c3VzZS5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBNYXIgMjIsIDIwMjEgYXQgMDU6MDI6NDRQTSAr
MDEwMCwgQXJuZCBCZXJnbWFubiA8YXJuZEBrZXJuZWwub3JnPiB3cm90ZToKPiA+IEknbSBub3Qg
c3VyZSB3aGF0IGlzIGV4cGVjdGVkIHRvIGhhcHBlbiBmb3Igc3VjaCBhIGNvbmZpZ3VyYXRpb24s
Cj4gPiBwcmVzdW1hYmx5IHRoZXNlIGZ1bmN0aW9ucyBhcmUgbmV2ZXIgY2FsbHMgaW4gdGhhdCBj
YXNlLgo+IFllcywgdGhlIGZ1bmN0aW9ucyB5b3UgcGF0Y2hlZCB3b3VsZCBvbmx5IGJlIGNhbGxl
ZCBmcm9tIHN1YnN5c3RlbXMgb3IKPiB0aGVyZSBzaG91bGQgYmUgbm8gd2F5IHRvIG9idGFpbiBh
IHN0cnVjdCBjZ3JvdXBfc3Vic3lzIHJlZmVyZW5jZQo+IGFueXdheSAoaGVuY2UgaXQncyBvayB0
byBhbHdheXMgYnJhbmNoIGFzIGlmIHNzPT1OVUxMKS4KPgo+IEknZCBwcmVmZXIgYSB2YXJpYW50
IHRoYXQgd291bGRuJ3QgY29tcGlsZSB0aGUgYWZmZWN0ZWQgY29kZXBhdGhzIHdoZW4KPiB0aGVy
ZSBhcmUgbm8gc3Vic3lzdGVtcyByZWdpc3RlcmVkLCBob3dldmVyLCBJIGNvdWxkbid0IGNvbWUg
dXAgd2l0aCBhCj4gd2F5IGhvdyB0byBkbyBpdCB3aXRob3V0IHNvbWUgcHJlcHJvY2Vzc29yIHVn
bGluZXNzLgoKV291bGQgaXQgYmUgcG9zc2libGUgdG8gZW5jbG9zZSBtb3N0IG9yIGFsbCBvZiBr
ZXJuZWwvY2dyb3VwL2Nncm91cC5jCmluIGFuICNpZmRlZiBDR1JPVVBfU1VCU1lTX0NPVU5UIGJs
b2NrPyBJIGRpZG4ndCB0cnkgdGhhdApteXNlbGYsIGJ1dCB0aGlzIG1pZ2h0IGJlIGEgd2F5IHRv
IGd1YXJhbnRlZSB0aGF0IHRoZXJlIGNhbm5vdApiZSBhbnkgY2FsbGVycyAoaXQgd291bGQgY2F1
c2UgYSBsaW5rIGVycm9yKS4KCj4gUmV2aWV3ZWQtYnk6IE1pY2hhbCBLb3V0bsO9IDxta291dG55
QHN1c2UuY29tPgoKVGhhbmtzCgogICAgICAgIEFybmQKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0
CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
