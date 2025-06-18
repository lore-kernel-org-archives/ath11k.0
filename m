Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B147C71157
	for <ath11k@archiver.kernel.org>; Wed, 18 Jun 2025 09:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tlhto678Z/9eQGQbe5nkV0xep94YXZZdUP+gSZiE5HY=; b=bbXI8Gz+UekQHChZBtrMjUWTGH
	FklhdAkt5kTkbnhR/47qFjYDX+XXQCKd3SNgnARIYfyZy7deiebXyuIOwcJNBAiTc9NfKE2wVmjYX
	4WBAHFLRMKMRkhn5ccjEqZL2Z1QQ7ard7IrR4aRI+UBsHVR/5sVP7pqFfAsx49N6ztafohz02NQLX
	45g3bQWuTlPO8pKgvp7DEme33+3mWKHoN+OYx8m5/GjtKh1Kv/rh7MSXIzTL4RNE8CwgaiRQq+gn1
	aEYKniuIYYNCoeuUpNbIad2ycRaws7+ViiXN1WjEDJ8jJke0RC/RynwBDjcF20+Eo4AkAGvNJLfmZ
	a+T4b9ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRpZu-00000009gJE-1RZ4;
	Wed, 18 Jun 2025 09:59:34 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRpKy-00000009dzD-3asU
	for ath11k@lists.infradead.org;
	Wed, 18 Jun 2025 09:44:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1252CA52487;
	Wed, 18 Jun 2025 09:44:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB960C4CEE7;
	Wed, 18 Jun 2025 09:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750239847;
	bh=QkcnRg0iy50X+xX4AMzHouOiJ6kRpTXVHmHLRfKjhc4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=neEXwqZZmVh67q5zkgde9c29BEJCb6tH8Qua3s0TA+XrUU6VKIuH85vY6PNJdFof5
	 maQ//bBvXXqPemj4unlMGPULXfDmcvhSS257cQPK8cH27faQpTNluK4f/hhDCFLl8N
	 vaC2lV37WhMxyzToyowtD2tLl/+qNr7eqOPObJJHfBWqfPDhd0MHPFsBR7pPBfzBUB
	 Eje+IxB4j3kf0YCnzsGde+xzbz+S18GRuLiTIwCJP62Zsr82bQvl/OwtlkOm6G0JHZ
	 JTm7sdspl7ZhrjjdBecfrhVe/qT/kVY95XBTq2nd+DC4ICHjHdoAedo2Gq7diglOKN
	 Hf4L9l47vunpg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uRpKw-000000005Yg-2Obb;
	Wed, 18 Jun 2025 11:44:06 +0200
Date: Wed, 18 Jun 2025 11:44:06 +0200
From: Johan Hovold <johan@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH ath-next v3 5/6] wifi: ath11k: choose default PM policy
 for hibernation
Message-ID: <aFKKZtbTIesVYgJK@hovoldconsulting.com>
References: <20250328-ath11k-bring-hibernation-back-v3-0-23405ae23431@quicinc.com>
 <20250328-ath11k-bring-hibernation-back-v3-5-23405ae23431@quicinc.com>
 <d0cd065c-1cd1-4e56-8c57-60777b1f3664@oss.qualcomm.com>
 <aFJ-SwT1g500h3kC@hovoldconsulting.com>
 <db65c9f0-334f-43fb-bddf-316bf883a848@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db65c9f0-334f-43fb-bddf-316bf883a848@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_024409_019325_3AFCED9B 
X-CRM114-Status: GOOD (  23.37  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Wed, Jun 18, 2025 at 11:18:14AM +0200, Konrad Dybcio wrote:
> On 6/18/25 10:52 AM, Johan Hovold wrote:
> > On Wed, Jun 18, 2025 at 02:15:04AM +0200, Konrad Dybcio wrote:
> >> On 3/28/25 6:32 AM, Baochen Qiang wrote:
> >>> Now WoWLAN mode is chosen for those machines listed in the quirk table.
> >>> This works for suspend (S3) but breaks for hibernation (S4), because
> >>> WoWLAN mode requires WLAN power to be sustained, which is not the case
> >>> during hibernation. For hibernation, the default mode should be used.
> >>>
> >>> Register a PM notifier with which kernel can notify us of the actual PM
> >>> operation: if system is going to suspend, the original PM policy is
> >>> honored; while if it is hibernation, overwrite it with default policy.
> >>>
> >>> To summarize: for suspend (S3), WoWLAN mode is chosen for machines listed
> >>> in the quirk table, non-WoWLAN mode for others; for hibernation (S4),
> >>> non-WoWLAN mode is chosen for all.
> >>>
> >>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> >>>
> >>> Tested-by: Takashi Iwai <tiwai@suse.de>
> >>> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> >>> ---
> >>
> >> I've bisected the following splat to this patch, still happening on
> >> linux-next/master, WCN6855 + SC8280XP CRD, 100% reproducibility 
> > 
> > WFIW, I'm not seeing this with 6.16-rc2 (which has this patch) on either
> > the X13s or sc8280xp-crd (ath11k now fails to resume on the latter
> > because of missing regulatory data, but that appears to be a separate
> > regression).
> 
> Do you have CONFIG_DEBUG_NOTIFIERS?

Nope. Would have been useful to mention in your report.

But I'm not seeing the warning with 6.16-rc2 with that option enabled
either.

> >> [root@sc8280xp-crd ~]# echo mem > /sys/power/state 
> >> [   20.267830] fb0: Framebuffer is not in virtual address space.
> >> [   39.863070] PM: suspend entry (s2idle)
> >> [   39.908067] Filesystems sync: 0.035 seconds
> >> [   39.934453] ------------[ cut here ]------------
> >> [   39.939259] Invalid notifier called!
> >> [   39.939268] WARNING: CPU: 5 PID: 513 at kernel/notifier.c:79 notifier_call_chain+0x84/0x1a4
> >> [   39.951566] Modules linked in:
> >> [   39.954732] CPU: 5 UID: 0 PID: 513 Comm: bash Not tainted 6.14.0-rc4longbois-01215-g32d93b51bc7e #12177
> > 
> > 6.14?
> 
> g show 32d93b51bc7e2e557771abe4a88da69c609e3d52:Makefile | head
> 
> # SPDX-License-Identifier: GPL-2.0
> VERSION = 6
> PATCHLEVEL = 14
> SUBLEVEL = 0
> EXTRAVERSION = -rc4
> 
> it's been in the tree for a while

Ah, maybe in linux-next, it was only merged to mainline for 6.16-rc1.

Johan

