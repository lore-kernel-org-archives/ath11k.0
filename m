Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FF3C433F5
	for <ath11k@archiver.kernel.org>; Wed,  4 May 2022 16:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XLq19MW1o5TjfbqnQV7hWOG0gZtzt9YVZ9A75Whu6BE=; b=cPXQUndu9j897B
	2BLtqTTT1CY+vKfxicEIwNIL3TH0mco0CYABmgc+uPRibcRe0UPoJ4xLsi68OyE9VGIgRbQLnP1j+
	ruiSbse1F6zHiCFxULSUPRseg0ArXw+pww3AHLC6bcv8RQOoEKZj9V7eVilOkmEQsViv+j5IPcUCa
	kPKfoOtB1tqW3TGKDBw7BnD5MbwjBlINA++EUnhMa7hgtDzxJWtllwdamIQSrAOoLal1rH/mMyO0O
	W/nrpcRXVyKtE+sb1S77hKcbjE7zex9NFbsToFt9duIi6X0AyNXCRncagNAuPZyvZ3t6QS3Z4/SA3
	iWoBD3yNCQCLH1yed7sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmHme-00Be7z-Mz; Wed, 04 May 2022 16:23:24 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmHmc-00Be6p-21
 for ath11k@lists.infradead.org; Wed, 04 May 2022 16:23:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651681402; x=1683217402;
 h=from:to:cc:subject:references:date:in-reply-to:
 message-id:mime-version;
 bh=OsPbQDphxyS5T5cxqp789eGU8MxcDNRRBBbsrR9WKHU=;
 b=vXp+QumJcLcGBF8+wZTpb4qZ7/lIzCqZGYnDZTSpLOHLzVzZhG90WMRW
 zwQHXfkyqpZ0aIoJWrQ9vtzNXuqanh7ucQ0fk3wGOB4OYZ1S9uvkXIMHt
 QobbvyKPTA+W5o5LX+r2aE9x8JPsktDjm+7ugJ+1ispFL/76my50Aw5+y A=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 04 May 2022 09:23:17 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 09:23:17 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 4 May 2022 09:23:17 -0700
Received: from kvalo10 (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 4 May 2022
 09:23:14 -0700
From: Kalle Valo <quic_kvalo@quicinc.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
CC: <kbuild@lists.01.org>, Carl Huang <quic_cjhuang@quicinc.com>,
 <lkp@intel.com>, <kbuild-all@lists.01.org>, Linux Memory Management List
 <linux-mm@kvack.org>, <ath11k@lists.infradead.org>, Wen Gong
 <quic_wgong@quicinc.com>
Subject: Re: [linux-next:master 408/8237]
 drivers/net/wireless/ath/ath11k/wow.c:712 ath11k_wow_op_resume() warn:
 inconsistent returns '&ar->conf_mutex'.
References: <202205032236.kofEquX3-lkp@intel.com>
Date: Wed, 4 May 2022 19:23:12 +0300
In-Reply-To: <202205032236.kofEquX3-lkp@intel.com> (Dan Carpenter's message of
 "Wed, 4 May 2022 11:46:27 +0300")
Message-ID: <o5hh7658dxr.fsf@quicinc.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (windows-nt)
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_092322_201785_69208575 
X-CRM114-Status: UNSURE (   7.37  )
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

+ ath11k, wen

Dan Carpenter <dan.carpenter@oracle.com> writes:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   44a2f39e611ac0bc1f17c288a583d7f2e5684aa7
> commit: 90bf5c8d0f7ecddf96fc1cd9434af4e157b51970 [408/8237] ath11k:
> purge rx pktlog when entering WoW
> config: i386-randconfig-m021-20220502
> (https://download.01.org/0day-ci/archive/20220503/202205032236.kofEquX3-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.2.0-20) 11.2.0
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> smatch warnings:
> drivers/net/wireless/ath/ath11k/wow.c:712 ath11k_wow_op_resume() warn:
> inconsistent returns '&ar->conf_mutex'.
>
> vim +712 drivers/net/wireless/ath/ath11k/wow.c
>
> ba9177fcef21fa Carl Huang 2022-03-14 653 int
> ath11k_wow_op_resume(struct ieee80211_hw *hw)
> ba9177fcef21fa Carl Huang 2022-03-14  654  {
> ba9177fcef21fa Carl Huang 2022-03-14  655  	struct ath11k *ar = hw->priv;
> ba9177fcef21fa Carl Huang 2022-03-14  656  	int ret;
> ba9177fcef21fa Carl Huang 2022-03-14  657  
> ba9177fcef21fa Carl Huang 2022-03-14  658  	mutex_lock(&ar->conf_mutex);
> ba9177fcef21fa Carl Huang 2022-03-14  659  
> ba9177fcef21fa Carl Huang 2022-03-14  660  	ret = ath11k_hif_resume(ar->ab);
> ba9177fcef21fa Carl Huang 2022-03-14  661  	if (ret) {
> ba9177fcef21fa Carl Huang 2022-03-14 662 ath11k_warn(ar->ab, "failed
> to resume hif: %d\n", ret);
> ba9177fcef21fa Carl Huang 2022-03-14  663  		goto exit;
> ba9177fcef21fa Carl Huang 2022-03-14  664  	}
> ba9177fcef21fa Carl Huang 2022-03-14  665  
> ba9177fcef21fa Carl Huang 2022-03-14  666  	ath11k_hif_ce_irq_enable(ar->ab);
> ba9177fcef21fa Carl Huang 2022-03-14  667  	ath11k_hif_irq_enable(ar->ab);
> ba9177fcef21fa Carl Huang 2022-03-14  668  
> 90bf5c8d0f7ecd Carl Huang 2022-03-14  669  	ret = ath11k_dp_rx_pktlog_start(ar->ab);
> 90bf5c8d0f7ecd Carl Huang 2022-03-14  670  	if (ret) {
> 90bf5c8d0f7ecd Carl Huang 2022-03-14 671 ath11k_warn(ar->ab, "failed
> to start rx pktlog from wow: %d\n", ret);
> 90bf5c8d0f7ecd Carl Huang 2022-03-14  672  		return ret;
>
> goto exit;

Carl or Wen, are you able to send a fix for this?

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
