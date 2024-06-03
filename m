Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0960FC25B75
	for <ath11k@archiver.kernel.org>; Mon,  3 Jun 2024 16:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=VfcFfPl6DzQuF6BImv7DyhUIKck0BlyAyHTdUvi/FU4=; b=UsJuRLe6Ake89G
	Wz1NTWe/MKqwYfqBjByy3Qt+ofFqglvfDcksDb8mrJh5pvI2r7QkZWYGSX7W5mZk1QIPCEQYAMnys
	YXK3UX6lf3pzWbACUFc3bgfXc1NQ6ZZeBr3Q2CqymTGwX6AcFxHo8XOIEzpM5A65sE78zfAd3O3aW
	eCJDd5CVPMkKBGHyEHePUwjcVWHvbsZOTqhVco6iZzDcrilgcOonufniQpi7hMrTplPr8xYqtjGow
	pDRlkhy5bJO3S0UVJx+3+pKkL1QMMRGyqL+I+lUJrIk07+hAhEfh/LHjjFik8ExKekWMUvKkw5mGS
	IsRwMUnBnCg6IT+vawSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEAwQ-0000000HQSr-1or9;
	Mon, 03 Jun 2024 16:53:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEAwN-0000000HQRz-37fz
	for ath11k@lists.infradead.org;
	Mon, 03 Jun 2024 16:53:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9B9A860E04;
	Mon,  3 Jun 2024 16:53:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CDF7C2BD10;
	Mon,  3 Jun 2024 16:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717433624;
	bh=DyH3gpgi4qx6wflc8epTRwqQEEkxiiw8EGl6bIf3LLo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=hgENSSJYgdOnCETWiJY9P2q8PiNLuQHrp3hEsrHgzQ0pKYOsoy1fMSyxc5gUiT4/0
	 kt2eYRaUtxE9GsHNC7+/gjMM0RM/u6RQIc4eF9iHhxJ5BRAbWJKnpGqWAhezsLTw+C
	 nHXjnjB8jNexooMWyr7gS8s8q3JJQbDN9FbF1QxQhhB+ulwxiYkY+MOpRzqxqZTgVl
	 Gzcza1nHQ8D9zXVU0+IEe+vV2RFf9V9ARr6yffP4ZMcLvJWczK4XsWtjZTDzZ2vYr5
	 bflHiaCnK4DHzs3TI9dG5Li2FfJoUHV4VaIYbGmG1jLDDAvLrJYuHQ2KzTnq+/d0oV
	 /DqEeWnb+bfJA==
Date: Mon, 3 Jun 2024 11:53:42 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Dan Williams <dan.j.williams@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org, regressions@lists.linux.dev,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: Re: [regression] BUG: KASAN: use-after-free in
 lockdep_register_key+0x755/0x8f0
Message-ID: <20240603165342.GA685076@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a5k5ukew.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_095347_873089_FF75A818 
X-CRM114-Status: GOOD (  17.11  )
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

On Sat, Jun 01, 2024 at 11:39:03AM +0300, Kalle Valo wrote:
> Kalle Valo <kvalo@kernel.org> writes:
> 
> > Dan Williams <dan.j.williams@intel.com> writes:
> >
> >> Kalle Valo wrote:
> >> [..]
> >>> >> The proposed fix for that is here:
> >>> >>
> >>> >> http://lore.kernel.org/r/66560aa9dbedb_195e294b0@dwillia2-mobl3.amr.corp.intel.com.notmuch
> >>> >
> >>> > I get "Not Found" from that link, is there a typo?
> >>> 
> >>> I found this fix from for-linus branch:
> >>> 
> >>> # PCI: Fix missing lockdep annotation for pci_cfg_access_trylock()for-linus
> >>> https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?h=for-linus&id=f941b9182c54a885a9d5d4cfd97af66873c98560
> >>> 
> >>> But at least that doesn't fix my crash.
> >>
> >> Sorry for the broken link I mistakenly used a message-id from an
> >> internal thread with the intel.com reporter. However, it is moot now
> >> because the new direction is to revert the lockdep infrastructure:
> >>
> >> https://lore.kernel.org/r/171711745834.1628941.5259278474013108507.stgit@dwillia2-xfh.jf.intel.com
> >>
> >> (that link works...)
> >
> > Thanks, that links works :) I did a quick test with the three patches
> > and I didn't see any crashes anymore. But to be confident I need to run
> > overnight tests, I'll provide my Tested-by after that.
> 
> Ok, I'm now quite confident that the issues I saw are solved so:
> 
> Tested-by: Kalle Valo <kvalo@kernel.org>

Thanks for reporting the issue and testing the fix!  Can you please
respond with your Tested-by to the actual patch(es) you tested?

Bjorn

