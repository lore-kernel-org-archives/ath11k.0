Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB1C1C4707B
	for <ath11k@archiver.kernel.org>; Thu, 18 Jan 2024 09:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=odlufvkc5S8+IsxUUqJ/SwipJ1SfA/3aSvy9XarZpfY=; b=sBda1IH0lJWtFAbvhM6BnKTtOU
	+P0CIJlDRfATUUTiafmlEMEonAnhOmAxG+cwvJbZEYv9zBuf/hHkBWQX9xnC0U6e30tpbw5oar4kQ
	KJVUsL/LuYnxjYOGQl2K5ms7lPiMrwRLtyONc2CUnoHGjOvp81l6vim4BoIsm3Sj6QtCJG8bXuJyn
	/7lfaMkRQxTuIQu33JvyDS5xfyPbqWcrXtw1Ok/LiAM2CYr0Dwihjp5lolExgZvIhdqgB3ltMSxZ2
	nHZ+449W5oGXI0vqHPTW6equvPpMkHqx6EYaBNZUejv6XRjNA4r/EYds/vNUwa4NISGjqf9oqph5q
	O/nyw5zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQPBT-002Lpd-1w;
	Thu, 18 Jan 2024 09:59:39 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQPBQ-002LoU-2c
	for ath11k@lists.infradead.org;
	Thu, 18 Jan 2024 09:59:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 53D68CE1EF8;
	Thu, 18 Jan 2024 09:59:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEC4FC43390;
	Thu, 18 Jan 2024 09:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705571970;
	bh=NjX86DlStntu+MJIp3Aa05BuIWnmRXYEJlPsD8DHLkk=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=f+uFSISVW7Oo+Ghtm7izUKB1HHtum3ga+UMnvqr8DccCM0AiOs0xx+NWjooiuzJkW
	 6E5yJncHogBPzgwhMFPwKpm5ld65KfymEMEAjoKEZicO8RpUvRmTtJBqKnZwHBE8L6
	 4PyVewZSFlnDSXmiE3PBnfmu3yBIVcD2giecYR62EGUtMesZ0qHrSwW1z2vXBfy+Zg
	 4EsDBQ4E5GLjCJ9WxQiwwFnI2BOuergRd1ZO5Ebgk8PWT21DWge059xm+tePiSWlEy
	 bjXUJsfiMB5MHDsQ7FjVSqRpGWRXE7L7bXC1UOqLdDqbd3nRRzfCSdTQju3KaDcR6m
	 HLawum+FA86NQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3] wifi: ath11k: rely on mac80211 debugfs handling for
 vif
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240115101805.1277949-1-benjamin@sipsolutions.net>
References: <20240115101805.1277949-1-benjamin@sipsolutions.net>
To: benjamin@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 Benjamin Berg <benjamin.berg@intel.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170557196818.2861702.17779148994688585657.kvalo@kernel.org>
Date: Thu, 18 Jan 2024 09:59:29 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_015937_019657_CEE2B762 
X-CRM114-Status: UNSURE (   7.08  )
X-CRM114-Notice: Please train this message.
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

benjamin@sipsolutions.net wrote:

> From: Benjamin Berg <benjamin.berg@intel.com>
> 
> mac80211 started to delete debugfs entries in certain cases, causing a
> ath11k to crash when it tried to delete the entries later. Fix this by
> relying on mac80211 to delete the entries when appropriate and adding
> them from the vif_add_debugfs handler.
> 
> Fixes: 0a3d898ee9a8 ("wifi: mac80211: add/remove driver debugfs entries as appropriate")
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218364
> Signed-off-by: Benjamin Berg <benjamin.berg@intel.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Patch applied to wireless.git, thanks.

556857aa1d08 wifi: ath11k: rely on mac80211 debugfs handling for vif

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240115101805.1277949-1-benjamin@sipsolutions.net/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


