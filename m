Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 104C9C433FE
	for <ath11k@archiver.kernel.org>; Tue,  4 Jan 2022 15:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tgwFkfO2iKrCESxx2AYeysqxWcLUcKkKpZ2PfJCzCes=; b=YmdCnw6kwUnhOx
	3I0HNLHMD94kt/QzIyJT8cOhNW0NrrRNr41ylH0Wb+aAAp30k3QeYbBJcsehswrcc2vBfUrYV8bUd
	z/bdwJqSP52jeki40CT4Y+Ou9+lCJJwYi2gcoiFQnBss0UwB0BRabwimnAq5GDv1lA5+m6AC4Zugu
	RB4t38NIf3kAWZE2gIZv/oOye4yU5oIf/3t+m54XfRKqDeS2LiH6rRVZ7es/AW6bZ8eqUwG2Sf1SX
	Ptf4yHkCvPnvEB9XpbsupMano+j0MljWB+9ALIzvtKCBgFBwohS81WVceLNCxSsFl4Gf7VuCCQtN5
	xZmiihNsoXnRszY45MrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4lyk-00C0VW-72; Tue, 04 Jan 2022 15:44:02 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4lyh-00C0TE-IS
 for ath11k@lists.infradead.org; Tue, 04 Jan 2022 15:44:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641311039; x=1672847039;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=22y9EjrBRaMVy/mz9REdCI0A1LxLuq5BPOq8HpG1+gg=;
 b=Lwt1OJwTVHlWoTIDAsW9l7wZH57tSzFsO9SRi2qidRjoB0t0bahmNRa2
 srCzWBSKVJ69dcWGOgkrjNE7e3wSStn9tdrrhKz0dWi8ZGJ/qx1Iq0RLY
 2i8XkAxEN+FXSQTnrYHcRSeG9wt41f6nHVXcYb9HMgYLvfXsjkr1fkvIz
 JtUtPefxH28iKq+iFg0NfI0mOG+6k4zYEGfFY3sto2EZVBUL5F4wiJA79
 ZUk96ff1uy6+hJLeA61TdpRZebavZEYBJaKTJEbqY4p2IzJ3luOAGf6Uc
 TMOxyPqBGBE0uTsofhAxTtzW3876f2I5tPX8l4Nk+SxiOdQ+bBSotootu g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10216"; a="242201237"
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; d="scan'208";a="242201237"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2022 07:43:58 -0800
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; d="scan'208";a="688600650"
Received: from smile.fi.intel.com ([10.237.72.61])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2022 07:43:52 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1n4lxK-006GMj-Qz; Tue, 04 Jan 2022 17:42:34 +0200
Date: Tue, 4 Jan 2022 17:42:34 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jakub Kicinski <kuba@kernel.org>, mingo@kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, ast@kernel.org,
 daniel@iogearbox.net, bpf@vger.kernel.org, netdev@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-can@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 linux-hams@vger.kernel.org, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, bridge@lists.linux-foundation.org,
 linux-decnet-user@lists.sourceforge.net, linux-s390@vger.kernel.org,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 virtualization@lists.linux-foundation.org
Subject: Re: [PATCH bpf-next v2] net: don't include filter.h from net/sock.h
Message-ID: <YdRq6vKceOqscaKK@smile.fi.intel.com>
References: <20211229004913.513372-1-kuba@kernel.org>
 <5a82690c-7dc0-81de-4dd6-06e26e4b9b92@gmail.com>
 <20211229092012.635e9f2b@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211229092012.635e9f2b@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_074359_715186_2325BB22 
X-CRM114-Status: GOOD (  15.21  )
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

On Wed, Dec 29, 2021 at 09:20:12AM -0800, Jakub Kicinski wrote:
> On Tue, 28 Dec 2021 17:33:39 -0800 Florian Fainelli wrote:
> > It would be nice if we used the number of files rebuilt because of a 
> > header file change as another metric that the kernel is evaluated with 
> > from release to release (or even on a commit by commit basis). Food for 
> > thought.
> 
> Maybe Andy has some thoughts, he has been working on dropping
> unnecessary includes of kernel.h, it seems.

With this [1] announcement I believe Ingo is the best to tell you if this is a
right direction.

> It'd be cool to plug something that'd warn us about significant
> increases in dependencies into the patchwork build bot.
> 
> I have one more small series which un-includes uapi/bpf.h from
> netdevice.h at which point I hope we'll be largely in the clear 
> from build bot performance perspective.

[1]: https://lore.kernel.org/lkml/YdIfz+LMewetSaEB@gmail.com/T/#u

-- 
With Best Regards,
Andy Shevchenko



-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
