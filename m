Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B79C4828F
	for <ath11k@archiver.kernel.org>; Thu,  1 Feb 2024 16:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1vY8rGfIMjq9je2rE0Py30/zItWtbY5H3Tgqnk2+jHI=; b=mS0XVDeu1kxbvSLoDGZ+vXkm74
	+9X6fjuAIhQJjo4Jas7/eWC3K3l5JbEynxvOdvnE6rwNk9u5iRyCXIj92/1TuudvEkaYv7G0FCGIs
	vYjWkYcXEEO1cvxR1zk+iU2r5M6/sPlN2ELBC0xZlOIGCmVGdO7fJnYUin6nQCr5khtbJ094xg2Um
	fOwsdybTROzZjNKY+6jA8oACWzGfS8NbfbBBc4tyOCpmQD8ezgoH/9Rjre5d2I8e3qv8k1RJUzxRA
	idl5JMWnW7eRc0YMG6eZjOXex/I0NODGq/RhZOjhnM8cKNX0OnEHT2N2xE2SfCjAaa9OzOgawmNj6
	WvbS4jEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVZmf-00000008bqO-1Fqz;
	Thu, 01 Feb 2024 16:19:25 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVZmb-00000008bp6-1Ca4;
	Thu, 01 Feb 2024 16:19:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5BE32CE0E74;
	Thu,  1 Feb 2024 16:19:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 760F4C433C7;
	Thu,  1 Feb 2024 16:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706804358;
	bh=pSQXkVGhSGtJOxhtkZViUKXNZZUqaeze9tefymigJbA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=exyFCQTl+lEujf2xl6+qQVAB/fItTO43EFuBTk3rBdhLadCVw+liyTtzHRs7VoOJf
	 BQ1m3ISjqq/4i7TAC9lUa8VmaZ7dKfzbOOT/hYXL2Z22/O6ubtY5+SyMq981QOMNHM
	 1ckfRXeEUYUMYYCh3NiUuAkW7+cV3PyWT2Rouzqg1aN0LY+MGRYlOoq4Xz0RF0k0M3
	 KqpBYG1dpowlJhbezMVTZM3gi4yIrlLC0gYxTCwPLVJxx/F0bflFNFr9GnNOHGk6Bj
	 SD65/iWn6HEqD38xhNSYwPsLpGM8up20GaTj08oV352+gC8S2wRouz7wUdX3ZqvXIM
	 9eRHZqwk2af6g==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <oe-kbuild-all@lists.linux.dev>,  <ath10k@lists.infradead.org>,  kernel
 test robot <lkp@intel.com>,  <ath11k@lists.infradead.org>
Subject: Re: [kvalo-ath:pending 47/100]
 drivers/net/wireless/ath/ath11k/mac.c:7949 ath11k_mac_fill_reg_tpc_info()
 error: uninitialized symbol 'eirp_power'.
References: <202401311243.NyXwWZxP-lkp@intel.com> <87ttmtvfx4.fsf@kernel.org>
	<a2fb59bb-6090-433f-9c3d-d35aaab93e70@quicinc.com>
Date: Thu, 01 Feb 2024 18:19:15 +0200
In-Reply-To: <a2fb59bb-6090-433f-9c3d-d35aaab93e70@quicinc.com> (Baochen
	Qiang's message of "Thu, 1 Feb 2024 12:31:22 +0800")
Message-ID: <87zfwktaws.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_081921_522547_2D60D314 
X-CRM114-Status: GOOD (  10.68  )
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

Baochen Qiang <quic_bqiang@quicinc.com> writes:

> On 1/31/2024 8:35 PM, Kalle Valo wrote:
>> + ath11k list
>> kernel test robot <lkp@intel.com> writes:
>> 
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
>>> head:   2c471f31297856be56f60ef29f2565dea1470800
>>> commit: 92425f788feede9bf152ecf3fb7a264942ee7719 [47/100] wifi:
>>> ath11k: fill parameters for vdev set tpc power WMI command
>>> config: i386-randconfig-141-20240129
>>> (https://download.01.org/0day-ci/archive/20240131/202401311243.NyXwWZxP-lkp@intel.com/config)
>>> compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes:
>>> | https://lore.kernel.org/oe-kbuild-all/202401311243.NyXwWZxP-lkp@intel.com/
>>>
>>> New smatch warnings:
>>> drivers/net/wireless/ath/ath11k/mac.c:7949
>>> ath11k_mac_fill_reg_tpc_info() error: uninitialized symbol
>>> 'eirp_power'.
>> Baochen, could you take a look at this new warning and if it's valid
>> send a fix for it, please?
>
> I sent the patch yesterday. search
> "wifi: ath11k: initialize eirp_power before use"

Great, thanks again Baochen. It's always a good practice to reply to
build bot mails, something like "This is a valid warning, I'll fix it"
is usually enough.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

