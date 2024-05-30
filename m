Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06501C25B74
	for <ath11k@archiver.kernel.org>; Thu, 30 May 2024 08:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QzYBUKJt1hOcj80lTpHxb7jGsZGn+nOtgPYDuFEkB28=; b=ltMH2IUKoqzGtH8SKoLF1WzpqE
	uOSM5UEIFkIhfnluLU/yKacPNln7xCDDS1aIqnAD3ZnR46bl51qCVQCgCKm0gkQF30RSZu3VDT5V5
	F7ApmukxO2FRhiS0OLbmTIUCLuAGUjmHGfDwndkAeGz/QUdqOHtsmwshEPatjl7m4BNASSQJ7Irmz
	HD3MqTxSsAYBDD5ixZg79SUz7c97rRDL5HIkDae48q916LCfJL+mtRBZhkWxeVOc92cCZY1kRkSDk
	bcwuTvo24Ya9VZpkALqDgrtdFgeps9x7x8k17ojFJtu/GyKaz1JzUXRw7Jhu6sSFq3BdxPe6VNBsS
	hfPWtAXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCazN-00000006bVP-0zOS;
	Thu, 30 May 2024 08:18:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCazK-00000006bUK-0a2C
	for ath11k@lists.infradead.org;
	Thu, 30 May 2024 08:18:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 648EB6243A;
	Thu, 30 May 2024 08:18:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF1FEC2BBFC;
	Thu, 30 May 2024 08:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717057096;
	bh=LLoCHtazLklqSTo51kZD1rOstdZdBmD8nkBBghMcTi4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=BfU1jynABdejcfPhHA29dQ+oPfGqOdMCRhwsYiCuOTSAI57JG6/7ULl25M79r3U2I
	 E8P7k8piRx5OYN2BMivUHzX80VgYR4fASP2JFI7GYBPbZkmQnXA/OFrCtS4lZpfCTa
	 oGV/SOVfbmyZe6Rgdm/ZfhW78oSeWxEEvUSEB9KadvOEMMsTH9xrt82Nu4MZl+/aEQ
	 VLJCqrdKRyx+ZZGP7oLhuIBGlQVAj4jINQ/ghGJwTgwD7y9KNL48MMANpHyV6pOpom
	 BfjikRWj9tXRbCykmUSeEQMIyhsAAsFeOEzozOdzgB8d3qPxCvStsIxt0TmdWaqihx
	 60pJTNBqYkwlw==
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
	<87jzjbwxin.fsf@kernel.org>
Date: Thu, 30 May 2024 11:18:12 +0300
In-Reply-To: <87jzjbwxin.fsf@kernel.org> (Kalle Valo's message of "Thu, 30 May
	2024 10:48:32 +0300")
Message-ID: <87frtzww57.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_011818_313990_49AEF185 
X-CRM114-Status: GOOD (  14.32  )
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
>>
>>> Kalle Valo <kvalo@kernel.org> writes:
>>> 
>>> > Kalle Valo <kvalo@kernel.org> writes:
>>> >
>>> >> Yesterday I run our ath11k regression tests with v6.10-rc1 and our
>>> >> simple ath11k module reload stress started failing reliably with various
>>> >> KASAN errors. The test removes and inserts ath11k and other wireless
>>> >> modules in a loop. Usually I run it at least 100 times, some times even
>>> >> more, and no issues until yesterday.
>>> >>
>>> >> I have verified that the last wireless-next pull request (tag
>>> >> wireless-next-2024-05-08) works without issues and v6.10-rc1 fails
>>> >> always, usually within 50 module reload loops. From this I'm _guessing_
>>> >> that we have a regression outside wireless, most probably introduced
>>> >> between v6.9 and v6.10-rc1. But of course I cannot be sure of anything
>>> >> yet.
>>> >>
>>> >> I see different KASAN warnings and lockdep seems to be always visible in
>>> >> the stack traces. I think I can reproduce the issue within 15 minutes or
>>> >> so. Before I start bisecting has anyone else seen anything similar? Or
>>> >> any suggestions how to debug this further?
>>> >>
>>> >> I have included some crash logs below, they are retrieved using
>>> >> netconsole. Here's a summary of the errors:
>>> >>
>>> >> [ 159.970765] KASAN: maybe wild-memory-access in range
>>> >> [0xbbbbbbbbbbbbbbb8-0xbbbbbbbbbbbbbbbf]
>>> >> [  700.017632] BUG: KASAN: use-after-free in lockdep_register_key+0x755/0x8f0
>>> >> [ 224.695821] BUG: KASAN: slab-out-of-bounds in
>>> >> lockdep_register_key+0x755/0x8f0
>>> >> [ 259.666542] BUG: KASAN: slab-use-after-free in
>>> >> lockdep_register_key+0x755/0x8f0
>>
>> The proposed fix for that is here:
>>
>> http://lore.kernel.org/r/66560aa9dbedb_195e294b0@dwillia2-mobl3.amr.corp.intel.com.notmuch
>
> I get "Not Found" from that link, is there a typo?

I found this fix from for-linus branch:

# PCI: Fix missing lockdep annotation for pci_cfg_access_trylock()for-linus
https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?h=for-linus&id=f941b9182c54a885a9d5d4cfd97af66873c98560

But at least that doesn't fix my crash.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

