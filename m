Return-Path: <SRS0=20C1=QG=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1596EC433EF
	for <ath11k@archiver.kernel.org>; Fri, 19 Nov 2021 09:57:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD4E561AD2
	for <ath11k@archiver.kernel.org>; Fri, 19 Nov 2021 09:57:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CD4E561AD2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bQ3t8j09Iwp1/cSXgf1gj4hENLjC3gUzxOA/VMlh05g=; b=RZeLEyz9urlcaI
	9qD26fAbx1wHip3+sivQHSQg1GLxphy/R6me6xreUjY8/fJMO2meRCg9ZR75Ozz0gCt/V5yoTRrKn
	DQ/grxMfQe3Lfck8vha8U+tWP06ElA/uHYnTPl3B4QeGshox6/PM1VmaE9JzY+YPjCIq0Y5zEElds
	ypOl0uRu4rxsrbac1TEpsJg/AXQ9Ife0AK91e5B6RIrzfXv+/CHJMwpve5vB10H9X37HfuTrGNw1S
	it/vbsxUV1HM8+o4fysd/tOLv+ITKppvhhOUxHq5Cgc3tFhg128p8HYhAiLUXqNy45s2fuZK9N6V1
	LONbPk2ae/uMim/gBu7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo0eB-00A3ie-M4; Fri, 19 Nov 2021 09:57:31 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo0e8-00A3hi-8Y
 for ath11k@lists.infradead.org; Fri, 19 Nov 2021 09:57:29 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637315847; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=IEO46rDtgspzaK/zNqTgOWED7gSik+/ygymaEd5+7Tk=;
 b=XB/GN1M5C9hsmoZs2J5xLYbaunCvOWc+pk00g7jtsS/8xac4svmr+Mry6jq5alrlX19F3/2T
 aCfkPsUZE2aVJsfcoMiLRSdjL7puFeVE8KMWUIzxtKNwQqu8ElW/E3T4Uex6PMm57k4yH0iV
 rLL0bZcSt5acFKtR3AOYQZeq1JY=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 619775061e1d2f5233d3f553 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 19 Nov 2021 09:57:26
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 83F9FC43616; Fri, 19 Nov 2021 09:57:26 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9E005C4338F;
 Fri, 19 Nov 2021 09:57:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 9E005C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: kernel test robot <lkp@intel.com>
Cc: Seevalamuthu Mariappan <seevalam@codeaurora.org>, llvm@lists.linux.dev,
 kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
 Miles Hu <milehu@codeaurora.org>,
 Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>, ath11k@lists.infradead.org
Subject: Re: drivers/net/wireless/ath/ath11k/mac.c:5408:22: warning: parameter
 'changed_flags' set but not used
References: <202111190031.U5H7J6W3-lkp@intel.com>
Date: Fri, 19 Nov 2021 11:57:19 +0200
In-Reply-To: <202111190031.U5H7J6W3-lkp@intel.com> (kernel test robot's
 message of "Fri, 19 Nov 2021 00:53:41 +0800")
Message-ID: <8735nseadc.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_015728_379776_4ED39110 
X-CRM114-Status: GOOD (  14.84  )
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

kernel test robot <lkp@intel.com> writes:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   42eb8fdac2fc5d62392dcfcf0253753e821a97b0
> commit: 689a5e6fff75229ac7c2af7a9c51dc2d3ca1882b ath11k: monitor mode clean up to use separate APIs
> date:   8 weeks ago
> config: x86_64-randconfig-a006-20211118 (attached as .config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c46becf500df2a7fb4b4fce16178a036c344315a)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=689a5e6fff75229ac7c2af7a9c51dc2d3ca1882b
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 689a5e6fff75229ac7c2af7a9c51dc2d3ca1882b
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=x86_64 
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
>>> drivers/net/wireless/ath/ath11k/mac.c:5408:22: warning: parameter 'changed_flags' set but not used [-Wunused-but-set-parameter]
>                                               unsigned int changed_flags,
>                                                            ^

The commit below should fix this:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=ath-next&id=624e0a317030

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
