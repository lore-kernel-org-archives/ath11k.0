Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A2EEE49B0
	for <ath11k@archiver.kernel.org>; Wed, 23 Aug 2023 14:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u4Lfqh/Z/glhha/B4MQtFH40xNOYcqTyqefv9PsOiPg=; b=5D5dm3fQXWH001
	eL9PPEMWz6YNwJjFr7iPyFVTd+jB/ki2H/jKALqoNA93+PgKUcdweZcpEPJ1DXwFgUGTVeBLkpWGr
	YE8ZgpaNAsSUNFRYJSr0jN1xdWlnsS4JN9Gud8YD0XxRZjA1fBqUhKoTXU/sjbjjM07yNfTZ4CSok
	B0DlkmVSZ9g5TzQ3w82JZixl8efCHVJtWrwlyUOdQZzv36BT1OhH1Nebt5SAYuWUSZyI4+VY4mu+t
	4vSUiU6iMgjIS640l85jg8OowIisoC5DDZwoNvdgwIMWy1VOuogtUhjUipiTI9UYbGpR/dqYbO2xC
	+aSEmLQgIqVmqPA1Yr0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYoX8-000oS1-1b;
	Wed, 23 Aug 2023 14:08:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYoX6-000oRZ-10
	for ath11k@lists.infradead.org;
	Wed, 23 Aug 2023 14:08:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A3A7E6200F;
	Wed, 23 Aug 2023 14:08:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF0A6C433C7;
	Wed, 23 Aug 2023 14:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692799706;
	bh=wlPZUJtwIjOU67ARs1NWL8noFWW1XT2B5EgDGcarzqg=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=jjEepA/o941RRSBqT8phh6gU6jDQpgZAqMhEWu4/QHn8KwUuLbN4MBaoWMl1IgtPA
	 B4mRtJkwdMsrUl/KJ7IcObhUdr7VjvGtY3BJ9M3BLRqefdpynpMELyKPt8KuhELr04
	 bFeLPt6yJQXPWphI5a9aE/xv0hwpbwDim7GBMF9joWRcpXHjwZ/WbumNdt0inn6qT4
	 qaERTdsTXepIHHxNz89gb/SwtNbJ7PDol+14OZHSGEtnTtiDbqLY7ZbJanjyx7gxU7
	 zCfFgZeCmH3cYflh/v20oOFTrZ2KecfwX6IM3yV3KqA5e2EKTFJQC6qPqVe/pWqDPT
	 1amfpJchUFcfw==
MIME-Version: 1.0
Subject: Re: [PATCH -next] wifi: ath11k: simplify the code with
 module_platform_driver
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230804091255.1347178-1-yangyingliang@huawei.com>
References: <20230804091255.1347178-1-yangyingliang@huawei.com>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: <linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>,
 <quic_jjohnson@quicinc.com>, <yangyingliang@huawei.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169279970384.1241462.812415762244736136.kvalo@kernel.org>
Date: Wed, 23 Aug 2023 14:08:25 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_070828_409313_5EE17A34 
X-CRM114-Status: UNSURE (   6.35  )
X-CRM114-Notice: Please train this message.
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

Yang Yingliang <yangyingliang@huawei.com> wrote:

> The init/exit() of driver only calls platform_driver_register/unregister,
> it can be simpilfied with module_platform_driver.
> 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

749a660b3903 wifi: ath11k: simplify the code with module_platform_driver

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230804091255.1347178-1-yangyingliang@huawei.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
