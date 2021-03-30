Return-Path: <SRS0=ucx4=I4=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E5D6C433E1
	for <ath11k@archiver.kernel.org>; Tue, 30 Mar 2021 15:01:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E662B61921
	for <ath11k@archiver.kernel.org>; Tue, 30 Mar 2021 15:01:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E662B61921
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HsoQCcQdMxwMbxo78rKA5VGGLcqGk9ZUgCgiP9FPTio=; b=HfK7LKTAfZba+mrrYxYMMUK/A
	e0wsRIvXBlWP8+FOkb42BJO2/zuP09WeeuSzxJBmHEGirZsllt9+mlunhLA1yZWg37npuH20PotAc
	KZ9H7YJvFX0gqEr0xy0gqiKBzAdkHZbQz/fG5nYXGcB4CAK2S0XwLR2nUYG05LCTF4kvpN2T6Y79k
	T/qW0UhmAnKhfHENQOReeq7EUWQKM2a6phNQ2oU1W/5D/VQaWNPfgNlK+0dY/TePjP2Vx9lBfUQ9C
	AehpgMu/yC9oKw21qmfuj3xrpCG/dm4LF3MXc0FBNbsSwFfn/dj04vuzXBkJpFPlfNzTmIGDq0AHD
	YZJR+KBcA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRFsJ-0045QE-6G; Tue, 30 Mar 2021 15:01:47 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRFc0-0042eD-Lf; Tue, 30 Mar 2021 14:44:58 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1617115495; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=llTp9KMmNhLgpFrt/A/4gk0SgpNaUf1ZpYpNvho6oEk=;
 b=iKbol1UC2cYC03I2rvUtoSu92j1pz2tv1L6/9iiw7cxLhRzh90EQvV5vkd5t59I4w79b5z
 //6Ea77uYBp+fXZGWtXmCr26hrFxJVsTlICwAL4byi52zB9FKuPbHVzN1zqRgW2z3Slp3o
 4tg7hayC693qItZd+Jni902Xu3F2GZQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EC1C6B315;
 Tue, 30 Mar 2021 14:44:54 +0000 (UTC)
Date: Tue, 30 Mar 2021 16:44:52 +0200
From: Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Martin Sebor <msebor@gcc.gnu.org>, Tejun Heo <tj@kernel.org>,
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>,
 the arch/x86 maintainers <x86@kernel.org>, Ning Sun <ning.sun@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Kalle Valo <kvalo@codeaurora.org>, Simon Kelley <simon@thekelleys.org.uk>,
 James Smart <james.smart@broadcom.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Anders Larsen <al@alarsen.net>, Serge Hallyn <serge@hallyn.com>,
 Imre Deak <imre.deak@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 tboot-devel@lists.sourceforge.net,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, ath11k@lists.infradead.org,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Networking <netdev@vger.kernel.org>,
 linux-scsi <linux-scsi@vger.kernel.org>, Cgroups <cgroups@vger.kernel.org>,
 LSM List <linux-security-module@vger.kernel.org>,
 Roman Gushchin <guro@fb.com>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Alexei Starovoitov <ast@kernel.org>,
 Andrii Nakryiko <andriin@fb.com>, Odin Ugedal <odin@uged.al>,
 Cong Wang <xiyou.wangcong@gmail.com>,
 Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: Re: [PATCH 06/11] cgroup: fix -Wzero-length-bounds warnings
Message-ID: <YGM5ZJlK1V7ex9xR@blackbook>
References: <20210322160253.4032422-1-arnd@kernel.org>
 <20210322160253.4032422-7-arnd@kernel.org>
 <YGLkPjSBdgpriC0E@blackbook>
 <CAK8P3a3nUCGwPpE+E820DniY8Haz1Xx72pA38P6s5MWsbi0iAQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK8P3a3nUCGwPpE+E820DniY8Haz1Xx72pA38P6s5MWsbi0iAQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_154457_144188_3669E1BF 
X-CRM114-Status: GOOD (  13.63  )
X-Mailman-Approved-At: Tue, 30 Mar 2021 16:01:41 +0100
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
Content-Type: multipart/mixed; boundary="===============2631564344710499884=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org


--===============2631564344710499884==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9pRQkLwCQMovNrXD"
Content-Disposition: inline


--9pRQkLwCQMovNrXD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 30, 2021 at 11:00:36AM +0200, Arnd Bergmann <arnd@kernel.org> wrote:
> Would it be possible to enclose most or all of kernel/cgroup/cgroup.c
> in an #ifdef CGROUP_SUBSYS_COUNT block?
Even without any controllers, there can still be named hierarchies (v1)
or the default hierarchy (v2) (for instance) for process tracking
purposes. So only parts of kernel/cgroup/cgroup.c could be ifdef'd.

Beware that CGROUP_SUBSYS_COUNT is not known at preprocessing stage (you
could have a macro alternative though).

> I didn't try that myself, but this might be a way to guarantee that
> there cannot be any callers (it would cause a link error).
Such a guarantee would be nicer, I agree. I tried a bit but anandoned it
when I saw macros proliferate (which I found less readable than your
current variant). But YMMV.

Michal

--9pRQkLwCQMovNrXD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEEoQaUCWq8F2Id1tNia1+riC5qSgFAmBjOV4ACgkQia1+riC5
qSgZNQ/9FFBZs5QQqEUHmbWyF9O2R2bGF8WCBz56zh+F2OZf+/GK7z4OGhkKUlEa
1lPOUoibt4aZZhWD30RcfB3i3qJ8VqY3wqwnS6W9uN9+sU22sgsx/elCqiua3EnM
4tGDRcLBfSuktgPo1T0oNvGGbFnFJ0kUenLZ6mVkWlSTzx8kp/B8h4S5LkYmRIov
fVmHURht22FPiA8wwlUb9LAp8ONF+68t6BtMWNmZbqmJ17qHSnLyQQUiHIHytASt
xgaQCJU8/nrtv2xPfp66aCQLO12b6OxpjPoRxo1hj9IP5HZPukzNDat/VaWyh0iE
t9GO85K0PVqcuvJpymes0yRT6RvEwlqEna0T+qbh+qih4S3+xRm/Js5IV5m8KfIc
wWUve4llNT1jq6zzgn28FkXe9coH7ybpwBaWeAdwEM3Wl9GvXimKwIQqg+3ZDnm4
CbDVh6scYVu3kFYHVy6ld5+fG2GWEKvNL+9AVH+wsXUb6OXtyOtxD3FWyiVVYBkl
Q4N0KWETd67BNb2NklxTkeC4hYusuHeFvxa9Ki6K6zbdxDxVwdcTWpWFVkTDs45S
sEVkmsPU9pLu5vm5o9kBCmr6q1lW6yzudcxBvcvcHXGQnkfcmDCo+C3OEwKzKUeh
8+BhDV9zMpKBpJfuPiI8UNIt8sI7YeTpjdk14YjWYQTgZCHc7WU=
=iFNx
-----END PGP SIGNATURE-----

--9pRQkLwCQMovNrXD--


--===============2631564344710499884==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============2631564344710499884==--

