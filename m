Return-Path: <SRS0=IuQG=HT=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79A4BC433DB
	for <ath11k@archiver.kernel.org>; Wed, 17 Feb 2021 09:39:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1593864D9A
	for <ath11k@archiver.kernel.org>; Wed, 17 Feb 2021 09:39:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1593864D9A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Message-Id:To:References:In-Reply-To:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lk+NkL4+cVnW6s5IB7Efok40Sw7+061zAq7uid51GQs=; b=zeH1Ynsj5QNl2JoQ1JBwNan4w
	rfYowWf2qAw3e/GsBaiPz4dk2czN892H+ycldYskNCiinkvU7qVsZhSmJ+H7xbB2qP/RjScOiudbr
	wSYdd23BYwPd5dBEEWQHc2FdE96xCHEdIH3yBGZE1JlYHVTcv/YwNj3feKigd1faRUa7lQmtTjwbp
	uuQzRoYM5y5uaADQiiohwWCHN8fwvW0kYN0/MlfqHZZqFqFKKL3iwaU0Gt2bXiJmy5QYyUTao/Lsk
	IP76mNPvwtd0qQwbhm2V1o13f+DSQk/3fVuPj4BJW882DfPpjpO0YzdbRXiHaXKfUK8lIlSUWvI3+
	Yvpndo/uA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCJIV-0001UH-1p; Wed, 17 Feb 2021 09:39:03 +0000
Received: from m42-2.mailgun.net ([69.72.42.2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCJIS-0001TT-KV
 for ath11k@lists.infradead.org; Wed, 17 Feb 2021 09:39:01 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1613554738; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=jUl5dkKVOyX/GS4SK+4hg3smk6Y58coDdPM1QG9SwG0=;
 b=jfwYFVHVCR4Ky5Z8RnXzy9usJIArZ12RSN0UpkOc8PO+EoeeGSWbovFXau2ceOwp5lezWX5q
 C+mpMLZj42n33gx6WMd4XFB3u2WsgL/dWi/zQhC4Wr9jUDFC3Vde6TLhe3iQQG7MkHEO2fSd
 QO5ilo6KZXZKn5E320UepUP1egw=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 602ce42b1e797edad8b6dfec (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Feb 2021 09:38:51
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 891BCC433C6; Wed, 17 Feb 2021 09:38:50 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 17E1CC433CA;
 Wed, 17 Feb 2021 09:38:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 17E1CC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH 01/11] ath11k: Refactor ath11k_msi_config
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1612946530-28504-2-git-send-email-akolli@codeaurora.org>
References: <1612946530-28504-2-git-send-email-akolli@codeaurora.org>
To: Anilkumar Kolli <akolli@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20210217093850.891BCC433C6@smtp.codeaurora.org>
Date: Wed, 17 Feb 2021 09:38:50 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210217_043900_761275_4F19C49C 
X-CRM114-Status: UNSURE (   7.87  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: Anilkumar Kolli <akolli@codeaurora.org>, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Anilkumar Kolli <akolli@codeaurora.org> wrote:

> Move ath11k_msi_config to array of structures to add multiple
> pci devices support. No functional changes.
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1.r2-00012-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

11 patches applied to ath-next branch of ath.git, thanks.

7a3aed0c3c36 ath11k: Refactor ath11k_msi_config
16001e4b2e68 ath11k: Move qmi service_ins_id to hw_params
fa5f473d7643 ath11k: qmi: increase the number of fw segments
5f67d306155e ath11k: Update memory segment count for qcn9074
a233811ef600 ath11k: Add qcn9074 mhi controller config
480a73610c95 ath11k: add static window support for register access
6fe6f68fef7f ath11k: add hal support for QCN9074
e678fbd401b9 ath11k: add data path support for QCN9074
6289ac2b7182 ath11k: add CE interrupt support for QCN9074
7dc67af063e3 ath11k: add extended interrupt support for QCN9074
4e80946197a8 ath11k: add qcn9074 pci device support

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1612946530-28504-2-git-send-email-akolli@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
