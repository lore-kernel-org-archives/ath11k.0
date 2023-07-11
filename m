Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89258EB64DC
	for <ath11k@archiver.kernel.org>; Tue, 11 Jul 2023 06:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=abihtPmTzfuxsD9A4Aup8gUoFp3sTD8DcwYiSAhk/FY=; b=UJ7/73RC5yt9rH
	JwKT4CRvdKkaR7qAA/XMjXSDDEhmKEMUQlh1+RgUFNzfxctBVz+ojJizpAZnGojYwNEpmBzb6gqgl
	M1Ndtl+qW0Ecytfn4IcFzjPgxGmv4fKvpZAqpUCa/1jqbkBYiHg/JoWWwxwaa6mS0pBUiIPv3dctl
	iw0heQ5g7LeJ3DmOPhNkkbnnOsD9K4lBu3td6NwXJ4sfF4RHyMcYDraFLdYB5CHkDxvlJZamfoPt5
	SfJxDT90Iqh7SdwtPhdyBI5jXQfdnnxUFZmuAOa7p693GrJo+hADtX5ww5TlR0sqOk2zqkoQ4mgbM
	I6t52SoxROSVCliu6XAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ73V-00DttO-0c;
	Tue, 11 Jul 2023 06:41:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ73S-00Dtsg-2G
	for ath11k@lists.infradead.org;
	Tue, 11 Jul 2023 06:41:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8BAE86131C;
	Tue, 11 Jul 2023 06:40:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9BB3C433C8;
	Tue, 11 Jul 2023 06:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689057657;
	bh=EMDQ8n6s4uVXebs8rlUmtF4sMjk0GSqW8H9dqH1D4xw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=U6w3eiqNJbpZGPDgguPFC94bPKjKwkv0p1fbs2L1cLUVhmTTMl/H2zntoK71IB9Bm
	 ey14lsKP7Q5y5LZTGASj0uSuWxCLSRXHK7snbsiCo8Y+Dy46pPMhePVCF/UZX7dJFL
	 mMH60fPJXnJ5tbZi42BX9/mcjOB7JYfDkCdhRyz2FGHDRXdd4IwINIXfP0nbaBeoCy
	 wcNLn4lzy2GzS//ymXHlGhnkISE2Z5MyVqeKqnoVU0am5UzaexfMPSNGmsUMVNOX8l
	 wcBNYcihRBOA8NB990/0k8klkPYpncJ77u+AxceGp3Fy369Dfi1jzwuqiOvGNBRIs2
	 8tPX/g6/2WABw==
From: Kalle Valo <kvalo@kernel.org>
To: Arowa Suliman <arowa@chromium.org>
Cc: ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org,  Arowa
 Suliman <arowa@google.com>,  kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] wifi: ath11k: Add crash logging
References: <20230710230546.3544912-1-arowa@google.com>
Date: Tue, 11 Jul 2023 09:40:53 +0300
In-Reply-To: <20230710230546.3544912-1-arowa@google.com> (Arowa Suliman's
	message of "Mon, 10 Jul 2023 16:04:53 -0700")
Message-ID: <87wmz77xxm.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_234058_798881_EBD2B71B 
X-CRM114-Status: UNSURE (   9.49  )
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

Arowa Suliman <arowa@chromium.org> writes:

> Change crash logging from debug to informational and add warning when
> firmware crash MHI_CB_EE_RDDM happens.

Why? What's the reason why you want to change this? The commit log
should always describe that.

> Tested-on: Qualcomm WCN6855

This is not correct format:

https://wireless.wiki.kernel.org/en/users/drivers/ath11k/submittingpatches#tested-on_tag

> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202306141105.c1e82Q0y-lkp@intel.com/

The robot only reported problems with your patch, it didn't report the
original problem. So you should remove these two lines.

> Signed-off-by: Arowa Suliman <arowa@google.com>

From and s-o-b have different email addresses.

Also this seems to a second version of your patch so you should have
marked it as v2 and include a changelog what changed from v1.

Please read our documentation from the wiki link below how to submit
patches.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
