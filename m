Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5766C433EF
	for <ath11k@archiver.kernel.org>; Tue,  7 Dec 2021 17:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CUsQORRDQSWSWBvG9EtCuWP13/UD0KPJsX5Xr+33kCE=; b=fL2fldFBUHbAz/
	sss4J1Z3J2kv8dThKUXMyDXBlvRWGwaFf50jwpPiwj4IF51nriUewsDn8ky+wTWyXrZ60IknWNSp2
	YkWnSO2fkXdI31wnLOwrLQvYFAHSVp23RzG9BmRf1PpmD7jg2MrbC44Ga0aAglCsfpvd0kWhwZysx
	SRDeHnjCeud7dxGJmrxV8RP8E8VePaMqSnNB1oywLvSokZ4Eilqp2xYE+9E10vNsIrPXIMDXBmKLK
	nbPc71Lv5DoAZXS9KAFla9QVBE1Wil2kZddxb2earlidP5hc+AdqKDYVj+mLBzrXACC9tfj7RMqwr
	iA01mCXAioKkJHCWOh4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mueZ9-009add-VM; Tue, 07 Dec 2021 17:47:47 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mueZ6-009abz-Bh
 for ath11k@lists.infradead.org; Tue, 07 Dec 2021 17:47:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B0F82B8174A;
 Tue,  7 Dec 2021 17:47:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82EBFC341C1;
 Tue,  7 Dec 2021 17:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638899258;
 bh=vwyuVDyRBHBHtjQAZ0ZBqofJI6JV7zSH7jyMIsKuZlE=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=PGC8T9lEsGcGN8u6gM+p+Gc/cBo7GLJS5f7xxIiDZXktDGjL0MHhEmTXElK/DeG0i
 j7i4F686dqs3m2UIF4IF2ZqzsCCdwhIAC5b0a49y0oXpYhqUXwTI8OCrfy1+t+E8Jp
 Jtdue/IrzoKoFfvERNAWPMbkQMr08n51+Ryan9CgeKElzy188IO6coYE354+SKyY+o
 fnorzYjiHQ51BS/jbfAyACjun5DOs7X4f5xmTtZvggU8NnunPJ/VUrUfaYAVbQ3Zr4
 mFsEJ2+l+UBv1ieEqlnVZR/spWxmGa3uxFxIhrY0ci78qZVIFaDZUaGKKGaV28NGoN
 AGudRklTs8eQA==
From: Kalle Valo <kvalo@kernel.org>
To: Jouni Malinen <jouni@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Baochen Qiang <bqiang@codeaurora.org>
Subject: Re: [PATCH 2/3] ath11k: Move pdev debugfs creation ahead
References: <20210913180902.193874-1-jouni@codeaurora.org>
 <20210913180902.193874-3-jouni@codeaurora.org>
Date: Tue, 07 Dec 2021 19:47:34 +0200
In-Reply-To: <20210913180902.193874-3-jouni@codeaurora.org> (Jouni Malinen's
 message of "Mon, 13 Sep 2021 21:09:01 +0300")
Message-ID: <87pmq8joi1.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_094744_559702_5DF3D587 
X-CRM114-Status: GOOD (  13.30  )
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

Jouni Malinen <jouni@codeaurora.org> writes:

> From: Baochen Qiang <bqiang@codeaurora.org>
>
> The sram dump debugfs interface has to be put under pdev directory
> located under /sys/kernel/debug/ath11k/<pdev name>. Currently pdev directory
> is created after firmware is ready, this is too late for sram dump.
> Suppose that if errors happen and ath11k fails to reach firmware
> ready, we have no way to dump sram content to debug cause the
> interface has not been created yet. So move it ahead.

I'm not sure about this. What will happen with other debugfs files now
that they are created before the firmware is ready, doesn't that create
race conditions?

Also we need to do some refactoring in debugfs, for example see Anil's
patch:

https://patchwork.kernel.org/project/linux-wireless/patch/1614160542-27882-1-git-send-email-akolli@codeaurora.org/

So I recommend dropping patch 2 for now and get the basic sram dump
functionality ready first. After that we can discuss how to handle
firmware crashes during driver initialisation, maybe coredump would be a
better approach?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
