Return-Path: <SRS0=L+f/=QE=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2501EC433EF
	for <ath11k@archiver.kernel.org>; Wed, 17 Nov 2021 07:30:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E96C561B54
	for <ath11k@archiver.kernel.org>; Wed, 17 Nov 2021 07:30:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E96C561B54
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N+dO8x7k4Xwy4mb7UUD98jJGRgtWV4foYd93LVOJNVg=; b=OA8zdTugKC30Wv
	f8KlJTEAYNQxBshS8r9ltsN+oHLFuqyxGv54Gp07vEMDJmuG6f45e2R3Mh6tONSyU3wBoc6/x+wKB
	0COxoj+7nRulIDSuPD+AE8ti4YVVD8p+AkkgD1RRNO9SoXV94S2DvBII6NTCllTm9/WZp/QPmTat5
	IeeuoKPwk0Gtyzuk4MQry3IS8I99+GLUAA1vzK+Jl5MwsNnq5VhnhlT1v8AxnHNAfMiBIBrCUIN+X
	eXoys0UESu1iagL0rRkyOdr/fXtBN1J69k2MhzaYSQw9f2cil/SdJ5KE/LRbf1u/rQNOq9YFy44Zr
	Cvx/tA3IUxv4lBCImb+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnFP6-003o9U-6w; Wed, 17 Nov 2021 07:30:48 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnFP3-003o8A-AY
 for ath11k@lists.infradead.org; Wed, 17 Nov 2021 07:30:46 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637134245; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=1gXrnzCeFOrjYyuqbijhva7EQ5G2IRLZAQy6nxsZ1Gk=;
 b=Y5KpHXvHK8PGG4iXl1r+EZhQ3bh5zXJZjoM+HOte5hOXFZrL7XfLCSVPmXqCYvKthnzFQPyc
 oTGtaE30elf1FVshZQtXc8/cqLs1uJ9cAg3yX0BShk5E0sHxNb8DaqSZrcMjO4gFILqailii
 G7d3o5JZaQ2CPNmpC/Mv0hO5EMY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 6194afa45bbbed1f7035c63d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Nov 2021 07:30:44
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6A534C4360C; Wed, 17 Nov 2021 07:30:44 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 000D8C4338F;
 Wed, 17 Nov 2021 07:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 000D8C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath11k: add string type to search board data in
 board-2.bin for WCN6855
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20211111065340.20187-1-quic_wgong@quicinc.com>
References: <20211111065340.20187-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163713424113.31320.4722033038215562438.kvalo@codeaurora.org>
Date: Wed, 17 Nov 2021 07:30:44 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_233045_469350_49E753AD 
X-CRM114-Status: GOOD (  12.11  )
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

> Currently ath11k only support string type with bus, chip id and board id
> such as "bus=ahb,qmi-chip-id=1,qmi-board-id=4" for ahb bus chip and
> "bus=pci,qmi-chip-id=0,qmi-board-id=255" for PCIe bus chip in
> board-2.bin. For WCN6855, it is not enough to distinguish all different
> chips.
> 
> This is to add a new string type which include bus, chip id, board id,
> vendor, device, subsystem-vendor and subsystem-device for WCN6855.
> 
> ath11k will first load board-2.bin and search in it for the board data
> with the above parameters, if matched one board data, then download it
> to firmware, if not matched any one, then ath11k will download the file
> board.bin to firmware.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Jouni Malinen <quic_jouni@quicinc.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

fc95d10ac41d ath11k: add string type to search board data in board-2.bin for WCN6855

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211111065340.20187-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
