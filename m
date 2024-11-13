Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 583C1D41C33
	for <ath11k@archiver.kernel.org>; Wed, 13 Nov 2024 11:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cO01FPTyWF0UKk+s5jmIWf1dApwvSflFb4uSUdIUd+M=; b=zlH8SwCDK7r9JWO2iA5UdbjKu7
	qxLtP0nRe9cY32LnBW2blIu+8JLSf+Wvq8ySGfh+UEAV9MmPQodf0WdoTwI1oY1taS1zDgnPxM1mR
	47WPoDUXMy3qd/5xK1uKx38X01zifMyqc5UE8TeYdMnDvS1h7G9ESTFe/2FUydWwaCPwsBqBAd/uA
	q9GyB/lBOWQRNGru5soXJAvpwtIgGS1MeXUSppOLL188vwtIZznKvyYIiHfo/0zX1KmxVDstjHvht
	75ac4ecUDlBMbxTRmPGpw3W69B6RBeDB8/jN1q/vnAPD2KGUCRxSjm72NdcDnOFPHNMxnu2Tj41hf
	0fPaWWNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBBLa-00000006YuG-0WQt;
	Wed, 13 Nov 2024 11:15:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBBKj-00000006YiL-3Csn
	for ath11k@lists.infradead.org;
	Wed, 13 Nov 2024 11:14:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DE5455C2CF4;
	Wed, 13 Nov 2024 11:14:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28587C4CECD;
	Wed, 13 Nov 2024 11:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731496488;
	bh=SfRuX/dV9mIBPRr+FPdrIt+g6zw+cc9zzZ61VvNw6Dw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=m7kgDf0OGkfTdnZopKqitXbSpnQwMTFiBH4V2k59gWg9Wtik/J5bi6dQTNa2Q7leW
	 66+qyjCFnpw3HZUzN7AsY0MkX9nKGdMLNdupNwOert3yYX5fqotDQSHY2LGX6oE6SL
	 JJvbhsgUy+G9kTywKsHCHfqjxHqsmfRdKQ8xfE5OF24P0vhel06RHnmQTX0Old717n
	 Qkr5R//TH656yJHY1fyE7Y8HQlA1Ssx/CHRNyklIShhyr+JF7C/wepkKrKqNQQehpa
	 fodJ/tE0f8C7qUFhm/jDit5aONZ6JRuhfEdVRLYsOEnoO9fUKHG2rSMT+pkKpM7mf/
	 WIueLMTcW6tPQ==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 3/6] wifi: ath11k: move some firmware stats related
 functions outside of debugfs
References: <20241113015631.3105-1-quic_bqiang@quicinc.com>
	<20241113015631.3105-4-quic_bqiang@quicinc.com>
Date: Wed, 13 Nov 2024 13:14:46 +0200
In-Reply-To: <20241113015631.3105-4-quic_bqiang@quicinc.com> (Baochen Qiang's
	message of "Wed, 13 Nov 2024 09:56:28 +0800")
Message-ID: <8734jv2xnd.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_031449_880284_105626BD 
X-CRM114-Status: UNSURE (   7.05  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Baochen Qiang <quic_bqiang@quicinc.com> writes:

> Commit b488c766442f ("ath11k: report rssi of each chain to mac80211 for QCA6390/WCN6855")
> and commit c3b39553fc77 ("ath11k: add signal report to mac80211 for QCA6390 and WCN6855")
> call debugfs functions in mac ops. Those functions are no-ops if CONFIG_ATH11K_DEBUGFS is
> not enabled, thus cause wrong status reported.

What do you mean exactly with wrong status reported?

mac.c is quite large already, making it even bigger is something I would
like to avoid.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

