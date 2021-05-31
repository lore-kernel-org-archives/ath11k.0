Return-Path: <SRS0=16SZ=K2=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA96FC47094
	for <ath11k@archiver.kernel.org>; Mon, 31 May 2021 03:05:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BD5C61074
	for <ath11k@archiver.kernel.org>; Mon, 31 May 2021 03:05:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BD5C61074
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vmoZxFSWvF804nZidrMV1nBNoO0H1mxk8IXcgz5f574=; b=Wyymu1ew6wF+1yoVpr+auFpyBs
	TrcTn3QaC02/tnqZJcXU4yhMrnfTg8HsqHAc5o4UykeWoBhTyXOid5wg8JLFGo/ZEx32HCVlxh1PZ
	Mfzx5GQukB0VcA6OYh5SFSU6nVFaILDire4J2EZR+s1gcXT+/dl6uG0z049ZRpMlaSDyJqppsEKbu
	UWgqz3hh/qyR4o2RX1oxX+u5MSOqIuEN71Eb81Ew/1wmdLOUpwhnu6WcsE0SUrVuVMkAqSM2rkoND
	GJpBWuiflAJK8KfOFY0vzzprnmcOxMQYbzJv4HlHnzjg3T1lmISgwIITy6XrV7Ow+fJrFeeRcCz/h
	DwO1JquA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnYEh-00AYCK-0d; Mon, 31 May 2021 03:05:03 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnYEb-00AYBB-2N
 for ath11k@lists.infradead.org; Mon, 31 May 2021 03:05:02 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1622430300; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Or/D49BJIOEB6eLFPLwThrUBfwDf6Y7sHmq8eM+/Z7Q=;
 b=WBnqFlIoxdi4i23r5VTVOZ0/jgr64e+pWlqd29V4l3bYobm4owtdwSDTvyAU4+Q8fbJCPbSp
 ZNUDjaYogwc/ZkGjmwoAX5+SLHUMHhrMOf/jm7pxxlgO8QmAVcuqr3dDUHrFVhstw9gFPzIC
 I0UbT/O5GChNCyJQ8VUdrKA5I2c=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 60b45243b7e6c05f95a25476 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 31 May 2021 03:04:35
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2A526C433F1; Mon, 31 May 2021 03:04:35 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4305BC433D3;
 Mon, 31 May 2021 03:04:33 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 31 May 2021 11:04:33 +0800
From: Wen Gong <wgong@codeaurora.org>
To: kernel test robot <lkp@intel.com>
Cc: johannes@sipsolutions.net, ath11k@lists.infradead.org,
 kbuild-all@lists.01.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2] wireless: add check of field VHT Extended NSS BW
 Capable for 160/80+80 MHz setting
In-Reply-To: <202105230249.n4ifN4Wm-lkp@intel.com>
References: <20210521021809.23986-1-wgong@codeaurora.org>
 <202105230249.n4ifN4Wm-lkp@intel.com>
Message-ID: <6dedc959bd3b7515a7e151ea4dae2964@codeaurora.org>
X-Sender: wgong@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210530_200501_092860_569FD846 
X-CRM114-Status: GOOD (  15.31  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 2021-05-23 02:36, kernel test robot wrote:
> Hi Wen,
> 
> Thank you for the patch! Perhaps something to improve:
> 
> [auto build test WARNING on mac80211-next/master]
> [also build test WARNING on mac80211/master v5.13-rc2 next-20210521]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:
> https://github.com/0day-ci/linux/commits/Wen-Gong/wireless-add-check-of-field-VHT-Extended-NSS-BW-Capable-for-160-80-80-MHz-setting/20210522-224810
> base:
> https://git.kernel.org/pub/scm/linux/kernel/git/jberg/mac80211-next.git
> master
> config: i386-randconfig-s001-20210522 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> reproduce:
>         # apt-get install sparse
>         # sparse version: v0.6.3-341-g8af24329-dirty
>         #
> https://github.com/0day-ci/linux/commit/ed41c78effa1b66bb3d00e368b92940e5ffadb57
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review
> Wen-Gong/wireless-add-check-of-field-VHT-Extended-NSS-BW-Capable-for-160-80-80-MHz-setting/20210522-224810
>         git checkout ed41c78effa1b66bb3d00e368b92940e5ffadb57
>         # save the attached .config to linux build tree
>         make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' W=1 
> ARCH=i386
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> 
> sparse warnings: (new ones prefixed by >>)
>>> net/wireless/chan.c:953:39: sparse: sparse: restricted __le16 
>>> degrades to integer
> 

please use new patch: "[PATCH v3] wireless: add check of field VHT 
Extended NSS BW Capable for 160/80+80 MHz setting"

...

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
