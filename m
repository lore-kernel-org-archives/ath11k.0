Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B247C4167B
	for <ath11k@archiver.kernel.org>; Mon, 13 Nov 2023 15:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2SKN5YXRD/1bbo/y1zuoQcbyrZg8cAV4EvsY1CVYkh0=; b=dHYmy52GKMzQhN
	UNCnggpnhPoX2W0vDezLXvH8vUWRXzUNsmhYXg6mEH+w3/BCHdd2qARmBj+NjJcRY6f3azGeF2EQt
	4aArKMgk+QW/YH/r2AU0YQ9vVssFjTf1jN2Q0lVhQwvDJ/+k9FsRa/KPySa/1UqZutmIsk6zPQ6Zx
	5En/0v/Xb6fcnsomVY2/CdfGWlVTLqn2tNea8QIg8VTs0m6lfPP+4ptX9t8PkFprGlSRaEVQqciWX
	yF5L6PvT+DVZOfVQrCrWF1NHL0clxHiCXahsBiL13aAPlinLVX7a+xX17Xoh2FIcQ1OQeKHUT/4Yc
	9jWJtohR2PPhCyJuoXoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Yaw-00EDC5-2l;
	Mon, 13 Nov 2023 15:11:22 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Yau-00EDBZ-0F
	for ath11k@lists.infradead.org;
	Mon, 13 Nov 2023 15:11:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 61577B80DF7;
	Mon, 13 Nov 2023 15:11:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1DFBC433C7;
	Mon, 13 Nov 2023 15:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699888277;
	bh=APV7Qhqjaxd3OtxJX4eUx/5vcGB1ZCX7+5XUWVVLz40=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Qd2FnMhU/BLN+iEceJaGOzttAdjrxg3zw/vuygyDA8PkMvp6whSa2zeGuQuuhuPgf
	 elLfZS0xEwTwiSLZJ3o8kCwTPIt5jBpfw0vmrYcoxe+vdTr22mWzg7Ig2pOA0Lvl9M
	 DCA9xEZLjKTgP88t9aP2e4sDSJ3jA7hrImjU2McOhcjh9/fB/GUpwtQlRgAvAj2Jpf
	 LgJnhuK8nwXcRLa+//beyuRAOrQ/BlI0EQy5G4Zb9OoqzMuerue8km5qi2JG/1Pk97
	 5TMbTS1tm9jVcUUVugV3UL5Hh0drWMQrnaJQ5hDwlcG6l5tM2fL04gC6wm62wukrG/
	 muLrt0bq/RUcw==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: James Prestwood <prestwoj@gmail.com>,  <linux-wireless@vger.kernel.org>,
  "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: Re: Can ath11k automatically enable CRYPTO_MICHAEL_MIC?
References: <c558e244-b10d-43f3-9f42-f6c2f98d5b95@gmail.com>
	<b2a44dc4-f5ec-46fe-a4ce-a2151ac65aa3@quicinc.com>
Date: Mon, 13 Nov 2023 17:11:14 +0200
In-Reply-To: <b2a44dc4-f5ec-46fe-a4ce-a2151ac65aa3@quicinc.com> (Jeff
	Johnson's message of "Wed, 8 Nov 2023 06:39:14 -0800")
Message-ID: <87edgtu1rh.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_071120_245285_579F9925 
X-CRM114-Status: GOOD (  12.83  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 11/8/2023 6:33 AM, James Prestwood wrote:
>> Hi,
>> I'm not very familiar with how the Kconfig stuff works, but I spent
>> longer than I care to admit trying to get the ath11k support to show
>> up in menuconfig.
>> The issue was CONFIG_CRYPT_MICHAEL_MIC was not set, which removed
>> the ath11k driver from menuconfig because of:
>> depends on CRYPTO_MICHAEL_MIC
>> Maybe there was a good reason (again, I don't know much about
>> Kconfig), but should/could this use "select" to automatically enable
>> CRYPTO_MICHAEL_MIC?
>> Thanks,
>> James
>
> + ath11k list to see if there is any history on this topic

I checked the history and this dependency was added by commit
243874c64c81 ("ath11k: handle RX fragments") back in 2020, the commit
message doesn't specify why 'depends on' was used instead of 'select'.

Further investigation shows that ath11k and ath12k are the only who use
'depends on' with CRYPTO_MICHAEL_MIC:

./drivers/net/wireless/intel/ipw2x00/Kconfig:	select CRYPTO_MICHAEL_MIC
./drivers/net/wireless/intersil/hostap/Kconfig:	select CRYPTO_MICHAEL_MIC
./drivers/net/wireless/intersil/orinoco/Kconfig:	select CRYPTO_MICHAEL_MIC
./drivers/net/wireless/ath/ath11k/Kconfig:	depends on CRYPTO_MICHAEL_MIC
./drivers/net/wireless/ath/ath12k/Kconfig:	depends on CRYPTO_MICHAEL_MIC
./drivers/staging/rtl8192e/Kconfig:	select CRYPTO_MICHAEL_MIC
./drivers/staging/ks7010/Kconfig:	select CRYPTO_MICHAEL_MIC

So switching ath11k and ath12k to use 'select' should be the best thing
to do. Patches welcome :)

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
