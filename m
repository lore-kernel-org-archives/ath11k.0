Return-Path: <SRS0=ZjKK=FV=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86FA3C4361B
	for <ath11k@archiver.kernel.org>; Thu, 17 Dec 2020 06:47:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C05123884
	for <ath11k@archiver.kernel.org>; Thu, 17 Dec 2020 06:47:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C05123884
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Message-Id:To:References:In-Reply-To:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kMXSk5LG61AN7cDApWFEd8QyenQrAyr5g6xV5dO0sqs=; b=SRDs7rQsM4Nr5QRD6sLq1bwjb
	aUwKSXPCARn44CRgSMSyUwcm24gcRvZWcGcB4j1E7WozpagLF4VWXUxjRzLjFr1gfLZxgX8YKpCFK
	QwnAHHeR36z1ZOKEl/7zX3xKRo0fEK+VlztMdS0OScoRB2XJ8s2yyA/5/6o1WLEBZzW2m7YvjiJaS
	POAmS0Paoru2mvzorsB4Qb1DtLJUJKgU775x/qmiIu+ga/O3UyCOqPFvwqSEjXJStTNG6fesf4eIg
	uaRL6C3Qkh8RiswR6RFPCygLNv35FHxssW78UbGV1cu28ZuNwqyNyIUta3Jd5XcCdVDJRt9Y9Q7va
	nxM82cNuw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpn4q-0001dj-Kx; Thu, 17 Dec 2020 06:47:52 +0000
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpn4l-0001cx-FH
 for ath11k@lists.infradead.org; Thu, 17 Dec 2020 06:47:51 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608187670; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=ZA+/8E/Qm6JEoSrCRxOHYrgy5HBvb7v/SVYvcH2vUWs=;
 b=Sj3hkn6LXMP5b+wLF/2lQdJHOIrrCgz90NGq0z5co49/edE9kdiTXRQ+4TU8nlMB7Z5EQe/e
 CxFicEshrxJMr9/m6rpCvjGoO58ZwG293TMyTFs262QIADAytYy6QhQ2r/1ganyNF07MB1uK
 MfJd9Cvzp8pJf8BhP56AoF93uyw=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5fdaff09bfd08afb0ddaa00b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 17 Dec 2020 06:47:37
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id BE009C43461; Thu, 17 Dec 2020 06:47:36 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5B581C433C6;
 Thu, 17 Dec 2020 06:47:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5B581C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: start vdev if a bss peer is already created
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20201211051358.9191-1-cjhuang@codeaurora.org>
References: <20201211051358.9191-1-cjhuang@codeaurora.org>
To: Carl Huang <cjhuang@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20201217064736.BE009C43461@smtp.codeaurora.org>
Date: Thu, 17 Dec 2020 06:47:36 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_014750_704309_A51EBE2E 
X-CRM114-Status: GOOD (  10.18  )
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
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Carl Huang <cjhuang@codeaurora.org> wrote:

> For QCA6390, bss peer must be created before vdev is to start. This
> change is to start vdev if a bss peer is created. Otherwise, ath11k
> delays to start vdev.
> 
> This fixes an issue in a case where HT/VHT/HE settings change between
> authentication and association, e.g., due to the user space request
> to disable HT.
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> 
> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-current branch of ath.git, thanks.

aa44b2f3ecd4 ath11k: start vdev if a bss peer is already created

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20201211051358.9191-1-cjhuang@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
