Return-Path: <SRS0=v7OI=IX=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AADDBC433DB
	for <ath11k@archiver.kernel.org>; Thu, 25 Mar 2021 09:53:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1375C61A14
	for <ath11k@archiver.kernel.org>; Thu, 25 Mar 2021 09:53:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1375C61A14
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ud1mp83x8TjGb5uoglmy6OePBLXXG2TSvqXHhSh7tBc=; b=dU+PeaeuXpUr3eln+Y0eBEQRy
	q3ekAaK9ctfxiYpSfwibNlQP7S5amRd1D0hSyLvhstsX7315IVunlgIVUpyBTs/wGBEkSq7Ubp2KT
	k47A/9UQGhhyClIoTVwQdFnVAJAv+rprFHLYeXSSoKgoXznA+xfIPJpr20aHNtQ8l/batgzFUolqF
	OIucYGACKMslH3d+ZXzt3t/BRoLd5TU5fbo9ZwEM9LeacZY8bUXGRAhydiCkTlZ5ymiK5aaWoo+y1
	yWPpIQW++5jLTRfSQQpQg/ow6kQ2rhWweTVoLrBZCYFv9nFC2FnAepYiF360XUDl8QePLab+qesee
	oP71c02/w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPMgN-0019ih-9e; Thu, 25 Mar 2021 09:53:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPMgH-0019h8-HQ; Thu, 25 Mar 2021 09:53:35 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A949161A2E;
 Thu, 25 Mar 2021 09:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616666011;
 bh=zDIkwCmITSxBLdjnUtP8aWuLpPIn7yP+onOPa2fWtIM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=aw+dq7xqFwszvQn+7YjwXW7/fxugShYPXJjaDJagcTuDAOuB8E9nNiKezq66fA/8m
 hFuPlB/FQy5OaxdMAZxMHga0tzWzb7PQ6p+xNpG4X8bAN7OAf2G+Qkm0llEzqPMeL1
 Kid4PdS5VCb6nVOuYhBFHH0Yau0kHvVybsDn9ffxag5/mdTWHzlRYsdW/dxayQNar3
 KY8Ym1MijDJv/mTgzfTa/iwhfzr2YqelyjbMy1v1O0PJUB5A8eiQqK6LL68YF5Ta8p
 SByPQKDJncOjrUNNBuwi03nuXQ11JZYKUdMwcj0KubiMCvSEyc/5dYjwzZVUc5ZcXd
 6uORErooXgDMw==
Received: by mail-oi1-f182.google.com with SMTP id d12so1491675oiw.12;
 Thu, 25 Mar 2021 02:53:31 -0700 (PDT)
X-Gm-Message-State: AOAM533QsmP3A/LE65qYR8W5agi6XpMZQufoBgakTJBclBGUyfLsx+Oj
 WZJY3AQYOFrzq7usjSceCDLhRVeQYKiRR4b7TUU=
X-Google-Smtp-Source: ABdhPJyt+33nuIsqD16dqkOAUJq8r6LTgDPW80yQCvhzID/3JW2uxW7CNu42WWpingJPnDTPb6eqRDMwNCcIjLZ5/jc=
X-Received: by 2002:aca:5945:: with SMTP id n66mr5293345oib.11.1616666010658; 
 Thu, 25 Mar 2021 02:53:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210322160253.4032422-1-arnd@kernel.org>
 <20210322160253.4032422-12-arnd@kernel.org>
 <87wntv3bgt.fsf@intel.com>
In-Reply-To: <87wntv3bgt.fsf@intel.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 25 Mar 2021 10:53:14 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0HGiPQ-k6t6roTgeUvVAMMY=fMnGV0+t48yJjz55XFAA@mail.gmail.com>
Message-ID: <CAK8P3a0HGiPQ-k6t6roTgeUvVAMMY=fMnGV0+t48yJjz55XFAA@mail.gmail.com>
Subject: Re: [PATCH 11/11] [RFC] drm/i915/dp: fix array overflow warning
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Martin Sebor <msebor@gcc.gnu.org>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 "the arch/x86 maintainers" <x86@kernel.org>, Ning Sun <ning.sun@intel.com>,
 Kalle Valo <kvalo@codeaurora.org>, 
 Simon Kelley <simon@thekelleys.org.uk>, James Smart <james.smart@broadcom.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Anders Larsen <al@alarsen.net>,
 Tejun Heo <tj@kernel.org>, 
 Serge Hallyn <serge@hallyn.com>, Imre Deak <imre.deak@intel.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 tboot-devel@lists.sourceforge.net, 
 Intel Graphics <intel-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, ath11k@lists.infradead.org, 
 linux-wireless <linux-wireless@vger.kernel.org>,
 Networking <netdev@vger.kernel.org>, 
 linux-scsi <linux-scsi@vger.kernel.org>, Cgroups <cgroups@vger.kernel.org>, 
 LSM List <linux-security-module@vger.kernel.org>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 Manasi Navare <manasi.d.navare@intel.com>, Uma Shankar <uma.shankar@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 Animesh Manna <animesh.manna@intel.com>, Sean Paul <seanpaul@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_095334_142432_BA465BC7 
X-CRM114-Status: GOOD (  27.49  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Thu, Mar 25, 2021 at 9:05 AM Jani Nikula <jani.nikula@linux.intel.com> wrote:
> > Clearly something is wrong here, but I can't quite figure out what.
> > Changing the array size to 16 bytes avoids the warning, but is
> > probably the wrong solution here.
>
> Ugh. drm_dp_channel_eq_ok() does not actually require more than
> DP_LINK_STATUS_SIZE - 2 elements in the link_status. It's some other
> related functions that do, and in most cases it's convenient to read all
> those DP_LINK_STATUS_SIZE bytes.
>
> However, here the case is slightly different for DP MST, and the change
> causes reserved DPCD addresses to be read. Not sure it matters, but
> really I think the problem is what drm_dp_channel_eq_ok() advertizes.
>
> I also don't like the array notation with sizes in function parameters
> in general, because I think it's misleading. Would gcc-11 warn if a
> function actually accesses the memory out of bounds of the size?

Yes, that is the point of the warning. Using an explicit length in an
array argument type tells gcc that the function will never access
beyond the end of that bound, and that passing a short array
is a bug.

I don't know if this /only/ means triggering a warning, or if gcc
is also able to make optimizations after classifying this as undefined
behavior that it would not make for an unspecified length.

> Anyway. I don't think we're going to get rid of the array notation
> anytime soon, if ever, no matter how much I dislike it, so I think the
> right fix would be to at least state the correct required size in
> drm_dp_channel_eq_ok().

Ok. Just to confirm: Changing the declaration to an unspecified length
avoids the warnings, as does the patch below:

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index eedbb48815b7..6ebeec3d88a7 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -46,12 +46,12 @@
  */

 /* Helpers for DP link training */
-static u8 dp_link_status(const u8 link_status[DP_LINK_STATUS_SIZE], int r)
+static u8 dp_link_status(const u8 link_status[DP_LINK_STATUS_SIZE - 2], int r)
 {
        return link_status[r - DP_LANE0_1_STATUS];
 }

-static u8 dp_get_lane_status(const u8 link_status[DP_LINK_STATUS_SIZE],
+static u8 dp_get_lane_status(const u8 link_status[DP_LINK_STATUS_SIZE - 2],
                             int lane)
 {
        int i = DP_LANE0_1_STATUS + (lane >> 1);
@@ -61,7 +61,7 @@ static u8 dp_get_lane_status(const u8
link_status[DP_LINK_STATUS_SIZE],
        return (l >> s) & 0xf;
 }

-bool drm_dp_channel_eq_ok(const u8 link_status[DP_LINK_STATUS_SIZE],
+bool drm_dp_channel_eq_ok(const u8 link_status[DP_LINK_STATUS_SIZE - 2],
                          int lane_count)
 {
        u8 lane_align;
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index edffd1dcca3e..160f7fd127b1 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1456,7 +1456,7 @@ enum drm_dp_phy {

 #define DP_LINK_CONSTANT_N_VALUE 0x8000
 #define DP_LINK_STATUS_SIZE       6
-bool drm_dp_channel_eq_ok(const u8 link_status[DP_LINK_STATUS_SIZE],
+bool drm_dp_channel_eq_ok(const u8 link_status[DP_LINK_STATUS_SIZE - 2],
                          int lane_count);
 bool drm_dp_clock_recovery_ok(const u8 link_status[DP_LINK_STATUS_SIZE],
                              int lane_count);


This obviously needs a good explanation in the code and the changelog text,
which I don't have, but if the above is what you had in mind, please take that
and add Reported-by/Tested-by: Arnd Bergmann <arnd@arndb.de>.

       Arnd

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
