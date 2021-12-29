Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC83AC433F5
	for <ath11k@archiver.kernel.org>; Wed, 29 Dec 2021 17:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dz0MTCP7vZ0e1LjTbf65oQkm6kcOzT40qNUvL6maYJs=; b=4IOkgP/rJZFLEo
	PDLwoArQR+4cDSaWwxlmOd7tpBoGUwc0vw8rVacIajjm4O8uS2vyafKRZP1pbDTSUXSq0AgrvBw2p
	3NTaxC5izerqpQe6H1xmjAdJps43J4Zy+l7iSWYj+FLJ4/iIQjl67kRI9nfLCDTNka2j8CCT0mfyC
	jqMN6HzXfL6ziWg3wbPSflet6fghl8pjN75+0af1Zrz9UH+OFI1rtHaX5cGX2g7ShiwFH4hoZf24C
	0PbAVBhac5qylwOb3+bXtVx7kGwrI9QnQ3Tdicgdj73yRDmhH253S8ycHYtpsVaKQuP3+qX4gQcvv
	u3KnPEhwfWTFyGMMCceQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2ccf-003BWL-QA; Wed, 29 Dec 2021 17:20:21 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2ccc-003BV1-AC
 for ath11k@lists.infradead.org; Wed, 29 Dec 2021 17:20:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EDFA1B81904;
 Wed, 29 Dec 2021 17:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2B5EC36AE9;
 Wed, 29 Dec 2021 17:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640798414;
 bh=mD55XiGnaxJafKvRs4q7sk9He7DhV4oGwfUm+8MHPSs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=c871heSWCTctS4GfXo9h3MeEdIN3+xN1XMTHmku30iWA8RKuAHoL9vEPa3clSxk3I
 lYqgCYWrSaJvGEZkpKVFAlQ4aUWz0M2PkvdzVNqxJaC37+/H1MBCvkHWOKkmk8kwm1
 sM3b5PIfgSqaCVOjfeV9864HlRBayb4Fua7XLpkebqflAstoOxvBMvEvKw31u31AL2
 iTr8zj8c7GeUnyCv0B2NghKXe3exAf+GB/HqdoF3SN797ly5jlaudliZlisbwPBJMn
 kAX6iM2/LNnkDDiHXND27O7a4DttQZLqab3RVRCQmetqRSTEGQP4cWlwwRwo5w887t
 ZwiJE97ykLWog==
Date: Wed, 29 Dec 2021 09:20:12 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, bpf@vger.kernel.org,
 netdev@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-can@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-hams@vger.kernel.org,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 bridge@lists.linux-foundation.org, linux-decnet-user@lists.sourceforge.net,
 linux-s390@vger.kernel.org, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, virtualization@lists.linux-foundation.org, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH bpf-next v2] net: don't include filter.h from net/sock.h
Message-ID: <20211229092012.635e9f2b@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
In-Reply-To: <5a82690c-7dc0-81de-4dd6-06e26e4b9b92@gmail.com>
References: <20211229004913.513372-1-kuba@kernel.org>
 <5a82690c-7dc0-81de-4dd6-06e26e4b9b92@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211229_092018_550788_A049A7C9 
X-CRM114-Status: GOOD (  10.97  )
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

On Tue, 28 Dec 2021 17:33:39 -0800 Florian Fainelli wrote:
> It would be nice if we used the number of files rebuilt because of a 
> header file change as another metric that the kernel is evaluated with 
> from release to release (or even on a commit by commit basis). Food for 
> thought.

Maybe Andy has some thoughts, he has been working on dropping
unnecessary includes of kernel.h, it seems.

It'd be cool to plug something that'd warn us about significant
increases in dependencies into the patchwork build bot.

I have one more small series which un-includes uapi/bpf.h from
netdevice.h at which point I hope we'll be largely in the clear 
from build bot performance perspective.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
