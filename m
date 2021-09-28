Return-Path: <SRS0=DASI=OS=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E608AC433F5
	for <ath11k@archiver.kernel.org>; Tue, 28 Sep 2021 09:15:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACAEA60FE3
	for <ath11k@archiver.kernel.org>; Tue, 28 Sep 2021 09:15:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ACAEA60FE3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cjCuhwGk5JUs/hc2GOUf31oqVfZEgBIU/5muqRoPmn4=; b=pB3S+2iok0o7Ol
	TaxK29EW2lOBqMgXcWZ8k+aqOILlOvyV02FFYT70Q1zaAzQjReb8s/acfTOdBMAMYpAX7GdWqXLS/
	iJXHvvby0TVYzkOh6hac/Hqw5gvjdr53D2fWGn7AT9tgMkFDFE3SHk7fWjK+WPkDYyMB/FMLCYP4d
	DsLlcJ0LpcP2vPcvtT5kXpfyBtNkSxzLw498dQOf8uUhz7j1R5xLg/d0KI7uGEyaO6EnGNco3CHPK
	QCF8PmXrLXDLMnZ+JHNsAj3vUU7pzWCrsF35JY9AppvxFGo7pIPqGHs6GOm+R96AupSIZ81dSESu1
	6eOKEcVx+fgDtO1AW3tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mV9Ce-006W6K-O2; Tue, 28 Sep 2021 09:15:08 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mV920-006RHy-MN
 for ath11k@lists.infradead.org; Tue, 28 Sep 2021 09:04:11 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632819849; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=09C7+Iq0CKL2hGEdanYSFMJLK30HPDjpfQExa8Wp094=;
 b=Zr/3T99tNVy6kDemTv6RSZzkyw3tsvqrTfDEJ0AgG2pv4nzk82m5sHMj7tpIovFWf96TYLf6
 IA+o7XSs6jRwmIcihbc/6G4Au/m8Tt8LoKkvzUPUvs0hyjw/0dgAC8fiByUfQJp/EDIGz7KW
 +8Q50OW5W9bztESDtXACfvy7ZhU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 6152da83713d5d6f968b27f6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Sep 2021 09:04:03
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 50B44C4363F; Tue, 28 Sep 2021 09:04:02 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6E798C4338F;
 Tue, 28 Sep 2021 09:03:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 6E798C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH 04/11] ath11: Wstringop-overread warning
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210322160253.4032422-5-arnd@kernel.org>
References: <20210322160253.4032422-5-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, Martin Sebor <msebor@gcc.gnu.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, Ning Sun <ning.sun@intel.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Simon Kelley <simon@thekelleys.org.uk>,
 James Smart <james.smart@broadcom.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Anders Larsen <al@alarsen.net>,
 Tejun Heo <tj@kernel.org>, Serge Hallyn <serge@hallyn.com>,
 Imre Deak <imre.deak@intel.com>, linux-arm-kernel@lists.infradead.org,
 tboot-devel@lists.sourceforge.net, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-scsi@vger.kernel.org, cgroups@vger.kernel.org,
 linux-security-module@vger.kernel.org, Carl Huang <cjhuang@codeaurora.org>,
 Maharaja Kennadyrajan <mkenna@codeaurora.org>,
 Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>,
 Johannes Berg <johannes.berg@intel.com>,
 Ritesh Singh <ritesi@codeaurora.org>,
 Rajkumar Manoharan <rmanohar@codeaurora.org>,
 Aloka Dixit <alokad@codeaurora.org>, Felix Fietkau <nbd@nbd.name>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-Id: <20210928090402.50B44C4363F@smtp.codeaurora.org>
Date: Tue, 28 Sep 2021 09:04:02 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_020409_753692_C7FC5519 
X-CRM114-Status: GOOD (  14.37  )
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

Arnd Bergmann <arnd@kernel.org> wrote:

> gcc-11 with the kernel address sanitizer prints a warning for this
> driver:
> 
> In function 'ath11k_peer_assoc_h_vht',
>     inlined from 'ath11k_peer_assoc_prepare' at drivers/net/wireless/ath/ath11k/mac.c:1632:2:
> drivers/net/wireless/ath/ath11k/mac.c:1164:13: error: 'ath11k_peer_assoc_h_vht_masked' reading 16 bytes from a region of size 4 [-Werror=stringop-overread]
>  1164 |         if (ath11k_peer_assoc_h_vht_masked(vht_mcs_mask))
>       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/net/wireless/ath/ath11k/mac.c: In function 'ath11k_peer_assoc_prepare':
> drivers/net/wireless/ath/ath11k/mac.c:1164:13: note: referencing argument 1 of type 'const u16 *' {aka 'const short unsigned int *'}
> drivers/net/wireless/ath/ath11k/mac.c:969:1: note: in a call to function 'ath11k_peer_assoc_h_vht_masked'
>   969 | ath11k_peer_assoc_h_vht_masked(const u16 vht_mcs_mask[NL80211_VHT_NSS_MAX])
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> According to analysis from gcc developers, this is a glitch in the
> way gcc tracks the size of struct members. This should really get
> fixed in gcc, but it's also easy to work around this instance
> by changing the function prototype to no include the length of
> the array.
> 
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99673
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

eb19efed836a ath11k: Wstringop-overread warning

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210322160253.4032422-5-arnd@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
