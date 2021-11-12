Return-Path: <SRS0=U53r=P7=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB33C433EF
	for <ath11k@archiver.kernel.org>; Fri, 12 Nov 2021 08:36:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A3F060F41
	for <ath11k@archiver.kernel.org>; Fri, 12 Nov 2021 08:36:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5A3F060F41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XCniNyd8Yq/IyzKRsG+4RUf0Gqdogqkgt3RPkuWfW2w=; b=3c4yEHR+imd6KX
	o47Ohe5dd8rfAGioaRSNF5cFqeJbV+PFIz58gghanEK6i5bW/zWWw6dc0paPWND/GemfUG9YiibmX
	brzlHAOIn/46bxvhvhTLYNDAQ1CC9gT05QFRe3z3uadkEAX9jXhU9qY79GaeDk167E7d6B0dRHJP3
	MP9rCzwDBe8dP4M7WxAEoQ14jJTlXCRFxWXqKx2UMyxQy0Nm0ygdWixcmApNCITUA2M5YlaiIs+e4
	7NitQsAjPl3gKlhKI9QCfSQ6EOlDLqtk6XYuVw+czZ9WBN+Kw4pbNG0auh4/4LVKJ69PLzxHvjjh/
	YTw7HM9vwr+p6r7JrqlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlS2h-009iSg-Va; Fri, 12 Nov 2021 08:36:15 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlRy3-009ghD-Td
 for ath11k@lists.infradead.org; Fri, 12 Nov 2021 08:31:29 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1636705887; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=Bscd3c16R/hEOC7YJcDkDsPfos4+Hdbw1xj3IIDxf4k=;
 b=rajOsVJ18MmyqlhDOrmrRl2iJNCWWhpq/+CKlrHGCWHaHzQvEB8SQZwpruRHXvPUcD+HP7fN
 a9iYMqW7aQpUxTIlOrsoA3P5onE+hAGWSmO0rAHbaGy9Al6HVjXSlpFykovuOF9JJ5sWHY80
 /B25nG9R+Eka3vaTR6G2MpHFyfs=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 618e265ea06361a254a84d6e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 12 Nov 2021 08:31:26
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 206C4C43150; Fri, 12 Nov 2021 08:31:26 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D08ABC4314C;
 Fri, 12 Nov 2021 08:31:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org D08ABC4314C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH v3 2/3] ath11k: Refactor update channel list function
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1634906227-22028-3-git-send-email-ppranees@codeaurora.org>
References: <1634906227-22028-3-git-send-email-ppranees@codeaurora.org>
To: P Praneesh <ppranees@codeaurora.org>
Cc: ath11k@lists.infradead.org, johannes@sipsolutions.net,
 linux-wireless@vger.kernel.org, P Praneesh <ppranees@codeaurora.org>,
 Karthikeyan Periyasamy <periyasa@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163670587845.25141.12042890222760708077.kvalo@codeaurora.org>
Date: Fri, 12 Nov 2021 08:31:26 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_003128_095405_081A9907 
X-CRM114-Status: UNSURE (   8.65  )
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

P Praneesh <ppranees@codeaurora.org> wrote:

> For sending scan channel list command to firmware through wmi, remain on
> channel's scan request parameter needs to be updated. Add scan_req_params
> as an argument to the existing update_scan_chan_list to update scan request
> parameter through wmi. Also, rename regulatory update scan channel list to
> the ath11k_wmi_update_scan_chan_list since it is moved to wmi file.
> 
> Co-developed-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
> Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
> Signed-off-by: P Praneesh <ppranees@codeaurora.org>

Why is ath11k_reg_update_chan_list() moved to wmi.c? I couldn't figure
out what's the reason for that.

2 patches set to Changes Requested.

12577691 [v3,2/3] ath11k: Refactor update channel list function
12577693 [v3,2/3] ath11k: Add ROC support for wide band scan

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1634906227-22028-3-git-send-email-ppranees@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
