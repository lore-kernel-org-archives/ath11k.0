Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E61E2C83F12
	for <ath11k@archiver.kernel.org>; Tue, 29 Aug 2023 11:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JZwOpNdgsjGkHeLbPCtcZbDz9GmJeIl2VyxWEakEvTA=; b=V0986zz6N3UMpE
	uy9/zK/uSsbPzpP9e2jFAXhlb3+70aBlYLwTGs91bxTwuAHBkqkbON4RfBdAkWKZ/jhS3yPQY2Whl
	F38Ie7X6fFyNYebaH1zfebnfHJ/3BNn5ew1GvmtRktPZBZWfFH5TQjjz0hwA4WVslhrUsJp5nH7wU
	UKVqlugFu/9ZqfF9ZPbFwWvyo05QfqIe3kUWtUNmo9U1QCWjAD3a470JvXy1BZtadmJZRboHOeV1b
	CG6HCoJJzvrZvw22WMlchuD6GmWUCfj8W54gmWuCWnv+WllJsKS9YjjOzdkWJXWXcVXJNJahDQTE3
	W+e1Fp3GtVeX8D2VRC1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaxI8-00BS0s-24;
	Tue, 29 Aug 2023 11:53:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaxI6-00BRzw-0w
	for ath11k@lists.infradead.org;
	Tue, 29 Aug 2023 11:53:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CA79A63682;
	Tue, 29 Aug 2023 11:53:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8236EC433C8;
	Tue, 29 Aug 2023 11:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693310029;
	bh=awCMTnDtvvGRTd8dGFD1IkkYqZZrzBBX9jyzuOvu4Mw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=agFtrIaz1YjzBj7XhxU4BIT6GF03xbYREjgBbWoY4enl1ZbCUnQ+s9XD7jSb4DCZA
	 XwYSOAIfpoKghEM+R/qcVCILrwUG8skQGKzDVvpog6Gn0JWfQy00JLeqKYqBC3ERVz
	 HYBtVOEYaco6FmaW1/3H0HbKb2ofuFjsoWkYmjeddmFTkFLKpXyuh/EZmk5FWfsV73
	 6rBwrJe1sZGZp8wTlb5O+0W2qImUqkxTUsfevQZSxzmPQsfURXL7oQoXw7TO3GgtD5
	 HesYxkhtR5WiY3mN8uQXJx85pjVVTYC4Z4jUkWR4REI2tyqQjvhMxRM4ttHo433QCR
	 HfqJ7iuXa7Xtw==
From: Kalle Valo <kvalo@kernel.org>
To: Arowa Suliman <arowa@chromium.org>
Cc: ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: [v4] wifi: ath11k: Add crash logging
References: <20230714001126.463127-1-arowa@chromium.org>
Date: Tue, 29 Aug 2023 14:53:46 +0300
In-Reply-To: <20230714001126.463127-1-arowa@chromium.org> (Arowa Suliman's
	message of "Thu, 13 Jul 2023 17:10:54 -0700")
Message-ID: <87h6oif4j9.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_045350_368504_4981516B 
X-CRM114-Status: GOOD (  15.39  )
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

Arowa Suliman <arowa@chromium.org> writes:

> Currently, the ath11k driver does not print a crash signature when a
> crash happens. Checked by triggering a simulated crash using the command
> [1] and checking dmesg for logs.
>
> [1] echo assert > /sys/kernel/debug/ath11k/../simulate_fw_crash
>
> Change the crash logging from debug to informational and add a warning
> when firmware crash MHI_CB_EE_RDDM happens.
>
> Tested-on: WCN6855 hw2.0 PCI
> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
>
> Signed-off-by: Arowa Suliman <arowa@chromium.org>

I did some cosmetic cleanup to the commit log.

> --- a/drivers/net/wireless/ath/ath11k/mhi.c
> +++ b/drivers/net/wireless/ath/ath11k/mhi.c
> @@ -325,14 +325,15 @@ static void ath11k_mhi_op_status_cb(struct mhi_controller *mhi_cntrl,
>  {
>  	struct ath11k_base *ab = dev_get_drvdata(mhi_cntrl->cntrl_dev);
>  
> -	ath11k_dbg(ab, ATH11K_DBG_BOOT, "notify status reason %s\n",
> -		   ath11k_mhi_op_callback_to_str(cb));
> +	ath11k_info(ab, "notify status reason %s\n",
> +		    ath11k_mhi_op_callback_to_str(cb));

In my view info, warning and error messages need to be at least somewhat
understandable to the user. I think this message is not understandable
and it should remain as a debug message. So I removed this change.

Please check my changes in the pending branch:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=f9325b14e830f3e8b5a557352e7c65f321bb7b05

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
