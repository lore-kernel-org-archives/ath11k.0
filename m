Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 453E3C25B76
	for <ath11k@archiver.kernel.org>; Sat,  1 Jun 2024 08:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H8IsQtwefooQY36Q+zYRtcGi+afG3WjPZM0ZUe3HU9E=; b=YUp88Haw1UwZmjYynolrqSKTfg
	CJ/XuE1H3AqGfkGGPxTjjJETsku9kRE6ObVYjpR6MbMInepnwGPXqyvek0SWCWFFdrvNvayngWNVP
	5nYSjY6HuJaFjrVizCXycVpce/6cggVjsbub/AeMMDw9psT3c02vQcd0lSiAzbBH4KLyQziNw3ywF
	WADHvT9k70sfs1sLCItHBWGMr/jC50fy5ngdJHpqXEU/kmFQKL3fKlNTKjT39V0GMAsHruQU1Xj8u
	XuLOhHTmrP7HmTkNLtPYdqiu5iq3j6lqyi638Lb2aNn6f/eC9Pjn8X2W4iGp02Jx67gIo6JLtmCXb
	m4vz0Org==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDKGg-0000000CEBD-3FOM;
	Sat, 01 Jun 2024 08:39:14 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDKGd-0000000CEAD-3u69
	for ath11k@lists.infradead.org;
	Sat, 01 Jun 2024 08:39:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 11873CE1C46;
	Sat,  1 Jun 2024 08:39:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 288E7C116B1;
	Sat,  1 Jun 2024 08:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717231147;
	bh=O/cdpqT7qQihzPF3SYw3ffdjHn+vpQtcKKcbKkl2pXA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=lmu1TjfAQQoBYhj/5tR7GS0uOuhgynxe5b8eTTxihKbYlFz9EB9BuMaGLeDxzIuQa
	 mPL1IUU24/j5KmRP7KUBe0uI7vvIS6NVX7i9Q3YerbU/Z3NPTj8MbRbneAyrTD41Ns
	 +xyUGP2pdDwyiS94iYPHYOSWOYwFHr7xM9UMtWUFO20gz1EReopk8uHvol1NzPcobS
	 lXYgd7nVOP7X8rb7cioKPkC2YQf1lIqdQPk4zPN5OLa/2Lr1c36cwTmNHFEp2BQ09M
	 Y6twVXL/tNg4qPu0VP9NjAWJCRtariHmDydaylbZd8zwK+h2jqVm/2nG+pUQt5shpx
	 JDfaxnwZkCo2g==
From: Kalle Valo <kvalo@kernel.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Dave Jiang <dave.jiang@intel.com>,  Bjorn Helgaas <bhelgaas@google.com>,
  <linux-wireless@vger.kernel.org>,  <ath11k@lists.infradead.org>,
  <regressions@lists.linux.dev>,  Jeff Johnson <quic_jjohnson@quicinc.com>,
  <linux-kernel@vger.kernel.org>,  <linux-cxl@vger.kernel.org>,
  <linux-pci@vger.kernel.org>
Subject: Re: [regression] BUG: KASAN: use-after-free in
 lockdep_register_key+0x755/0x8f0
References: <87v82y6wvi.fsf@kernel.org> <87wmncwqxf.fsf@kernel.org>
	<87sexzx02f.fsf@kernel.org>
	<66582bee45da8_6ec329496@dwillia2-mobl3.amr.corp.intel.com.notmuch>
	<87jzjbwxin.fsf@kernel.org> <87frtzww57.fsf@kernel.org>
	<6659ee8b8dfd_166872941c@dwillia2-mobl3.amr.corp.intel.com.notmuch>
	<87y17qudwb.fsf@kernel.org>
Date: Sat, 01 Jun 2024 11:39:03 +0300
In-Reply-To: <87y17qudwb.fsf@kernel.org> (Kalle Valo's message of "Fri, 31 May
	2024 19:47:32 +0300")
Message-ID: <87a5k5ukew.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240601_013912_221511_3A018751 
X-CRM114-Status: GOOD (  12.53  )
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

Kalle Valo <kvalo@kernel.org> writes:

> Dan Williams <dan.j.williams@intel.com> writes:
>
>> Kalle Valo wrote:
>> [..]
>>> >> The proposed fix for that is here:
>>> >>
>>> >> http://lore.kernel.org/r/66560aa9dbedb_195e294b0@dwillia2-mobl3.amr.corp.intel.com.notmuch
>>> >
>>> > I get "Not Found" from that link, is there a typo?
>>> 
>>> I found this fix from for-linus branch:
>>> 
>>> # PCI: Fix missing lockdep annotation for pci_cfg_access_trylock()for-linus
>>> https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?h=for-linus&id=f941b9182c54a885a9d5d4cfd97af66873c98560
>>> 
>>> But at least that doesn't fix my crash.
>>
>> Sorry for the broken link I mistakenly used a message-id from an
>> internal thread with the intel.com reporter. However, it is moot now
>> because the new direction is to revert the lockdep infrastructure:
>>
>> https://lore.kernel.org/r/171711745834.1628941.5259278474013108507.stgit@dwillia2-xfh.jf.intel.com
>>
>> (that link works...)
>
> Thanks, that links works :) I did a quick test with the three patches
> and I didn't see any crashes anymore. But to be confident I need to run
> overnight tests, I'll provide my Tested-by after that.

Ok, I'm now quite confident that the issues I saw are solved so:

Tested-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

