Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 184CDC433EF
	for <ath11k@archiver.kernel.org>; Tue,  5 Apr 2022 07:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N3FVu8VuUOl20Oj5QveR+uYMJSSoELaMjxdPyO8CUHw=; b=NHqqcCojbiXVlY
	99G8EUhdVqjn98jV6ugfu11Apjeu58K/Q6mf7h5QSe1gNy2DftUy1juOK2kqnw3c22CAXuslaA0+l
	O9SULojC4n/sO51LH/h8RXy3rYnSyZF88XI25bcxugAxoFpUuH5Db7kqRLkbK3ZcumlLjjWE/nSVR
	qckVjKgGJKUB6P8OpGn3aswBYJHSEj79hmBcqz5fnyy8lKkD7D1iCkmRYYwlzjc+oFDvkZr3eOXnF
	hnl/lkA4zT34YfnDNcnwrLdalpdpdNUVFYHfz1Uwc9kt8/fwmYn0T0hsy2pdBmvPoka0eu0YT8kla
	BIKZ5LKKwLwvWg89dY4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbdwF-0002Zu-Sk; Tue, 05 Apr 2022 07:49:19 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbdwC-0002ZS-6U
 for ath11k@lists.infradead.org; Tue, 05 Apr 2022 07:49:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2CE3CB81B16;
 Tue,  5 Apr 2022 07:49:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC9ECC340EE;
 Tue,  5 Apr 2022 07:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649144952;
 bh=FsWGZRZU5luoFcJ8Wj2q+FnEHag6sXtG+zcjWXjN7P8=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=X8YtQXq96B1J3ZAkb/S4eA0njiU95WZPOewAlV4RA6I8veRnAAOv1Jlri1nzaN+7u
 6K1/WcL5JJbq8Vdmdl1T4fmaUSGDjbEzmZQWeh21SBNYK7d/RD5ksGNHwJN1i1Ak3l
 4QpOwv0N+gXZ3gUE3LKxA/Pl/Pdd6ssyvZblsKxzx0evmwY6wPm+KJKU8PQowQ3JAY
 ERVorqCLWR2juZN99x3Yto/316s3Ke8+5wpOoAMLFzaeVPSZ3v/z7t224a/WUbs2AV
 z2IS6LHE04p+yVSL3qBT4BIgNIwa+A6KsfEARJ+HJ4a0P6IzKsyPcFtfm/qf+qeujG
 PbwemzEjRq1Yg==
From: Kalle Valo <kvalo@kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Aloka Dixit <quic_alokad@quicinc.com>
Cc: john@phrozen.org, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org
Subject: Re: [bug report] ath11k: add debugfs for TWT debug calls
References: <20220301074905.GA13071@kili>
Date: Tue, 05 Apr 2022 10:49:05 +0300
In-Reply-To: <20220301074905.GA13071@kili> (Dan Carpenter's message of "Tue, 1
 Mar 2022 10:49:05 +0300")
Message-ID: <8735isrmvi.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_004916_568914_5CEA4EFD 
X-CRM114-Status: GOOD (  16.10  )
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

+ aloka

Dan Carpenter <dan.carpenter@oracle.com> writes:

> Hello John Crispin,
>
> The patch fe98a6137d03: "ath11k: add debugfs for TWT debug calls"
> from Jan 31, 2022, leads to the following Smatch static checker
> warning:
>
> 	drivers/net/wireless/ath/ath11k/debugfs.c:1642 ath11k_debugfs_add_interface()
> 	warn: 'arvif->debugfs_twt' is an error pointer or valid
>
> drivers/net/wireless/ath/ath11k/debugfs.c
>     1637 int ath11k_debugfs_add_interface(struct ath11k_vif *arvif)
>     1638 {
>     1639         if (arvif->vif->type == NL80211_IFTYPE_AP && !arvif->debugfs_twt) {
>     1640                 arvif->debugfs_twt = debugfs_create_dir("twt",
>     1641                                                         arvif->vif->debugfs_dir);
> --> 1642                 if (!arvif->debugfs_twt || IS_ERR(arvif->debugfs_twt)) {
>     1643                         ath11k_warn(arvif->ar->ab,
>     1644                                     "failed to create directory %p\n",
>     1645                                     arvif->debugfs_twt);
>
> The debugfs_create_dir() function never returns NULL.  It's generally
> not supposed to checked for errors.  This code here looks like a
> layering violation because it's trying to check if debugfs is already
> registered.  But the clean up code just unregisters on the first call.
> Should it be ref counted or can the !arvif->debugfs_twt check be
> removed?
>
> Also if the user deliberately disabled debugfs then this prints an error
> message.
>
>     1646                         arvif->debugfs_twt = NULL;
>     1647                         return -1;

Please also use proper error values, not -1.

>     1648                 }
>     1649 
>     1650                 debugfs_create_file("add_dialog", 0200, arvif->debugfs_twt,
>     1651                                     arvif, &ath11k_fops_twt_add_dialog);
>     1652 
>     1653                 debugfs_create_file("del_dialog", 0200, arvif->debugfs_twt,
>     1654                                     arvif, &ath11k_fops_twt_del_dialog);
>     1655 
>     1656                 debugfs_create_file("pause_dialog", 0200, arvif->debugfs_twt,
>     1657                                     arvif, &ath11k_fops_twt_pause_dialog);
>     1658 
>     1659                 debugfs_create_file("resume_dialog", 0200, arvif->debugfs_twt,
>     1660                                     arvif, &ath11k_fops_twt_resume_dialog);
>     1661         }
>     1662         return 0;
>     1663 }

Aloka, you submitted this patch. Please take a look and fix the issues.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
