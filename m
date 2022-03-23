Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE78C433EF
	for <ath11k@archiver.kernel.org>; Wed, 23 Mar 2022 09:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pdr3c69VQC3viLwYWbZV2k5mGD1+91R+1dzeSxC5DQM=; b=mCCqhJ4IP8rYpk
	iDtVx3LMXPej7QP1gDdrN2MHBMraVIs9LrxLQ6IjB7McmOSsWjCBz2Ll7VRFlxfEQYKJtLXMTwO2b
	2cwWII9RJqtNRBMZTY9lkuPJSIKnW3vpaD4AS04fjXnH2tbwdycTabfyNWHX713bL4fWbtt5ZHkpd
	cb/mjsCTuoKtuSOV8WX46F1ruucui+FN3ModEowpuDKokbm8st88NqgfBsAq5oJs0tUUgv19vL3h9
	VZs4GyW0K7RikWkhtT0V7vQopc2z/kuW1LzcppjUzc5d05iqr7SXl2Hox6KGzm769Q4pyCC5md95F
	2r9hXlxqFnlk4s2wgI/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWxDr-00DEeO-Rq; Wed, 23 Mar 2022 09:24:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWxDo-00DEdW-MU
 for ath11k@lists.infradead.org; Wed, 23 Mar 2022 09:24:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8A70B617DA;
 Wed, 23 Mar 2022 09:24:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09F87C340E8;
 Wed, 23 Mar 2022 09:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648027443;
 bh=LkQSu4GtbjtlPRibNiKuRI3ET6kmKXw/PY8GIRgQhPo=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=chS3gRFQHMctCTHBquOoTQB/tVIt9yErI5uWb3Co3Jckt3im4cjxvWkJwRiiNIAWj
 KmdEj5vKv6rx0ckGNVh/36xlQGXpXjTqIboKmiwTZaCBxVNINMYPHd3cGxPK3qmdZf
 OSoSveupnDpVGRixXlNMB8z+k7UTW6IxSMp/1L8FtonDmqNRGnp1Ut6zMSESZkfcZr
 R7Ea94OA9muS33deWk0tud4TRT3YgI7dHBQQttP12545wz0sAdwmPdnE2S4qyafwpv
 MnOsmJZCed9WpmT9gKzX/ZWVbahxLZRcb4ExC4YgCxE7yZLPVDzRg06MRzB4YGu4KX
 W8L+S2O8xLKAw==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: store and send country code to firmware after
 recovery
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220322032224.11382-1-quic_wgong@quicinc.com>
References: <20220322032224.11382-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164802743902.26958.7086724509485424560.kvalo@kernel.org>
Date: Wed, 23 Mar 2022 09:24:01 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_022404_811864_D1E6EF2C 
X-CRM114-Status: UNSURE (   8.56  )
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

Wen Gong <quic_wgong@quicinc.com> wrote:

> Currently ath11k does not send the country code to firmware after device
> recovery, as a result the regdomain info is reported from firmware by
> default. Regdomain info is important, so ath11k also need to restore
> it to the value which was used before recovery.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>

Failed to apply, please rebase.

error: patch failed: drivers/net/wireless/ath/ath11k/core.h:619
error: drivers/net/wireless/ath/ath11k/core.h: patch does not apply
stg import: Diff does not apply cleanly

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220322032224.11382-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
