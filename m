Return-Path: <SRS0=XEXT=P3=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F2C8C433EF
	for <ath11k@archiver.kernel.org>; Mon,  8 Nov 2021 10:55:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1299B6112D
	for <ath11k@archiver.kernel.org>; Mon,  8 Nov 2021 10:55:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1299B6112D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jLtfd0xoLJfsBsBhX2uKYstWk59DD4W2Vjs+XBqRzrw=; b=IcBJuPN79TXlHJ
	JBqYt5DvhP+ahgKy8qh5f82LzVsv0a5hI5r2O9hfCv6JcyYsdMWH0c3s6ImVuc9kKFBcqfmxfTnrh
	lNsLy5fgGDGxOumXkQfF1OKGzZ1PNelLsIVaJHodv9CZOxjbYcdkG/ki1QD9f/5DpP/tEFeEKnlW4
	OUvO7HPoes1s+y2qfkAUOfyNfsHmQqsXttraEwhps8jo2akim4AO4joL9M3tw4FrOmi5OMN5VAEQZ
	a/dPBj5qAm/233bhfILJIoIbqN+Tyh3tzTQb204Krfdmu0RkVCsmX45cIPJ2F7lDmzqwFx8iVQbpV
	VeuCsA7wFF7VInCc4NYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mk2Jd-00GBom-NX; Mon, 08 Nov 2021 10:55:53 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mk2Ja-00GBnK-Bt
 for ath11k@lists.infradead.org; Mon, 08 Nov 2021 10:55:53 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1636368951; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=4M9uOTBXUH00cBBpv3ijxurnpayOaBUBlP63Y3jJYOc=;
 b=uOZZCJRVRWjx/btGIw9ei041OD8NSz0xLJZBEis7Y+CjJaxjq5S1+qjaaoLvA1Uv/wfBPyNq
 umxryDFJVEqK7phPtKuSc7uKUPctncmeVM6Dtfo5sKevN8AnPH82NDdIAxWFYmCrmSWHR3O9
 O2ZnHqB9Lhk5lm/lo+aDfRd094s=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 61890230b882f8ab2faf1c3e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 08 Nov 2021 10:55:44
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8D1B7C43618; Mon,  8 Nov 2021 10:55:44 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 92915C4338F;
 Mon,  8 Nov 2021 10:55:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 92915C4338F
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
 Jouni Malinen <jouni@codeaurora.org>, 
 "ath11k\@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: Re: drivers/net/wireless/ath/ath11k/mac.c:5408:22: error: parameter
 'changed_flags' set but not used
References: <202111061154.1NPBOyXF-lkp@intel.com>
Date: Mon, 08 Nov 2021 12:55:39 +0200
In-Reply-To: <202111061154.1NPBOyXF-lkp@intel.com> (kernel test robot's
 message of "Sat, 6 Nov 2021 11:54:04 +0800")
Message-ID: <87v912q5lg.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_025551_716739_C5B22D98 
X-CRM114-Status: GOOD (  15.41  )
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

+ ath11k list

kernel test robot <lkp@intel.com> writes:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   fe91c4725aeed35023ba4f7a1e1adfebb6878c23
> commit: 689a5e6fff75229ac7c2af7a9c51dc2d3ca1882b ath11k: monitor mode clean up to use separate APIs
> date:   6 weeks ago
> config: hexagon-buildonly-randconfig-r006-20211013 (attached as .config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a8c695542b2987eb9a203d5663a0740cb4725f)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=689a5e6fff75229ac7c2af7a9c51dc2d3ca1882b
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 689a5e6fff75229ac7c2af7a9c51dc2d3ca1882b
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=hexagon 
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>>> drivers/net/wireless/ath/ath11k/mac.c:5408:22: error: parameter 'changed_flags' set but not used [-Werror,-Wunused-but-set-parameter]
>                                               unsigned int changed_flags,
>                                                            ^
>    1 error generated.

Looks like a valid warning to me, can someone submit a patch?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
