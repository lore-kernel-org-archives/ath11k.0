Return-Path: <SRS0=ucx4=I4=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCB8FC433DB
	for <ath11k@archiver.kernel.org>; Tue, 30 Mar 2021 15:01:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D00061957
	for <ath11k@archiver.kernel.org>; Tue, 30 Mar 2021 15:01:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D00061957
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=m4fK0PuUpvcIwRU3S7MAoqLkVq30ZDUvloz9LGya+nc=; b=iegl56yUFEEuGYksoIgBG7/l8
	VPCHnMl4/ziFPbUrM6y6cjk7UUPj8ucipzVKtEIVi0CZNpTOnM4XErmbU17smNvzWavnd48d5xYor
	i/Pn84iVjPR7xCl1c3LER2jwvN6TVTtIoX9SuyvUqIDfkNQtq23GN1gmfeb8d32cI9uWeCw6FBgV2
	MluShAfU2w/R0BUZSCCcpoosahQeLP613UCDQDkh8TmrxHw1tDpbdSxJr5UzHICgazzfH5HWbGYnc
	3T/umxBpUxKpiKWtwXfLplQNJAjUvhS8gBOwVs2StXJtMVMQcpc0okBJD3BKYi4KKcu4MTKwXOnYn
	M/Ke4927Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRFsH-0045Px-Jg; Tue, 30 Mar 2021 15:01:45 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lR9wS-0033rX-Su; Tue, 30 Mar 2021 08:41:42 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1617093697; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jiLzz+FDg8IDgOr7Ru1IW7IRXYaqlH8yrJkDxBSOd+M=;
 b=SwyQOSqvaO5avOz2XsxkAeyYpWcAxuEpeTup5y2W/3hjoJIa9VL+ySLWFEDXOGMXYYzaNj
 yfuPCkvCrHUDqDn4OiHjX+VW5qEwgFf/bjJtmVzQs0eem+tKxgSvbAVrRlz0EIt6ankmR8
 9g4gU0a0vUOWreF+dSJDr1Ih1BW0A9I=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F0DDEB1C1;
 Tue, 30 Mar 2021 08:41:36 +0000 (UTC)
Date: Tue, 30 Mar 2021 10:41:34 +0200
From: Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, Martin Sebor <msebor@gcc.gnu.org>,
 Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Arnd Bergmann <arnd@arndb.de>,
 x86@kernel.org, Ning Sun <ning.sun@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Kalle Valo <kvalo@codeaurora.org>, Simon Kelley <simon@thekelleys.org.uk>,
 James Smart <james.smart@broadcom.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Anders Larsen <al@alarsen.net>, Serge Hallyn <serge@hallyn.com>,
 Imre Deak <imre.deak@intel.com>, linux-arm-kernel@lists.infradead.org,
 tboot-devel@lists.sourceforge.net, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-scsi@vger.kernel.org, cgroups@vger.kernel.org,
 linux-security-module@vger.kernel.org, Roman Gushchin <guro@fb.com>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Alexei Starovoitov <ast@kernel.org>,
 Andrii Nakryiko <andriin@fb.com>, Odin Ugedal <odin@uged.al>,
 Cong Wang <xiyou.wangcong@gmail.com>,
 Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: Re: [PATCH 06/11] cgroup: fix -Wzero-length-bounds warnings
Message-ID: <YGLkPjSBdgpriC0E@blackbook>
References: <20210322160253.4032422-1-arnd@kernel.org>
 <20210322160253.4032422-7-arnd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210322160253.4032422-7-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_094141_130329_0D02553C 
X-CRM114-Status: GOOD (  10.86  )
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
Content-Type: multipart/mixed; boundary="===============0562031213763931012=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org


--===============0562031213763931012==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Gbn4BprmVLVWv2rO"
Content-Disposition: inline


--Gbn4BprmVLVWv2rO
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 22, 2021 at 05:02:44PM +0100, Arnd Bergmann <arnd@kernel.org> w=
rote:
> I'm not sure what is expected to happen for such a configuration,
> presumably these functions are never calls in that case.
Yes, the functions you patched would only be called from subsystems or
there should be no way to obtain a struct cgroup_subsys reference
anyway (hence it's ok to always branch as if ss=3D=3DNULL).

I'd prefer a variant that wouldn't compile the affected codepaths when
there are no subsystems registered, however, I couldn't come up with a
way how to do it without some preprocessor ugliness.

Reviewed-by: Michal Koutn=FD <mkoutny@suse.com>

--Gbn4BprmVLVWv2rO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEEoQaUCWq8F2Id1tNia1+riC5qSgFAmBi5DcACgkQia1+riC5
qSjuqxAAkm/zoS+xvdcQUERzkcuVxIruGtTqOse/NCPQQR9aGuJl6iybyjQw7D+r
63+BYz7+BdP8zDg+NSTO354Yt0vsWFtCvuZBBabO91wCheLRPaZhHnGByJa0fXyM
SKC2VSvFHKKiFuCG7mG7/WfDQxTGSaUL2jiFXlA5HAV5dKfkia/Jpuf+KtIy5nBR
g8g4f44M2wW/TCoBzd5Elt5Cpx6fU2aKuJRCRCE04ts4CQy06/lLcc9H0N7bvgHj
0oxkHbAjXeEnylnni4pfpmJpInUT2kOZuCjSF/WPw2XeLs00AnBnNB3lDP9Pe2qo
ippcDc3AFqYMqewKnnxDWoTI3lyMTm8r0yzrDdwpb9Zv28bOCAYiwyoIsFV7+kdN
C7DnhiL6d+UgKIzCqRuTPXnluthvSmHGzeblqF1vOAaWOFif4CcRmUtsR7v3EyZN
5aiUTGqVtoKr/pcBNnRU1e2w7ulYpq5sbL/8f9HtnKsZ8MZlLdhdcDoSLjOkuohK
OlQgS6p+2otxwk3xft0CdFPPHAFb5/WM6IyKdewFGuY0fohxczWJCRI92x94cfe9
p0JSNLl19JjdM8loYpmBRcmlkoBH+MtkdZiR68b5yX5wcXypubmZPZ9o8ZzQqx1j
ZX1/nhuyDl6KHuGW7gJXx8FhCLd6nPyKYVu4wbay23oLzdL/1sk=
=nVTO
-----END PGP SIGNATURE-----

--Gbn4BprmVLVWv2rO--


--===============0562031213763931012==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============0562031213763931012==--

