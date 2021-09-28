Return-Path: <SRS0=DASI=OS=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5C62C433EF
	for <ath11k@archiver.kernel.org>; Tue, 28 Sep 2021 13:17:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A89EC61159
	for <ath11k@archiver.kernel.org>; Tue, 28 Sep 2021 13:17:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A89EC61159
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b5x9K/BF9Q9rFgXfALBLRW+sO/L03icMhmLMM4UIyCM=; b=YMngta32+u6m4B
	Lob5U3bY3YI5w7xT6tSTr8kagOYBTOqoGMLK5bq/NOdQGE4gSM93XUhHF0Utp3ZPJGgx+ynYoBPsO
	s/CpCqc9w3F6QTVFJC2LisdIwt4qCjGTdsju/zfTb5L+/RHAkaUXvZe27EgPXdL0b2YtqNeHamEU6
	VjEKNakoPZqdSSh7AsY/0UzV+B5Hri7iu4BsJz+ZKVRGuEeLRspRBiHgkCYHjQnOiUZ8UTcEhZfDR
	0p73HDAnOUw39Gwx3gVTGI1FMB1zasXR3qaK6CoFrPmjuNqTTLp5j4Ls93O2NThoGdsbD2x4RuGPo
	SEs04N1b6DoCo3lCpVug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVCzS-007JN0-E2; Tue, 28 Sep 2021 13:17:46 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVCzI-007JLp-0o
 for ath11k@lists.infradead.org; Tue, 28 Sep 2021 13:17:44 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632835063; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=Bex9NfHd4YuvWFIIqPH6LdWJr3p11Z8BxidaIv4OVlE=;
 b=EnCoTyEFwbNRVjCfOIq1uxbpKWMO/gXQ582SenoyimD1ZFbU8RcqEAz++KGsTQJzBMhTkeRj
 orK64IsKw2hsFAd0IZpS5hAlgKzTXMXhR3yoGvlyx4BjzqDlYaLRqJf4AS16J5Qmg+Avt0CL
 T2CJoXFpejyAKJicQ5uTdxLVppg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 615315dd605ecf100b9de897 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Sep 2021 13:17:17
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 74C9FC43616; Tue, 28 Sep 2021 13:17:17 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id CBFE5C43460;
 Tue, 28 Sep 2021 13:17:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org CBFE5C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] ath11k: add channel 2 into 6 GHz channel list
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210722102054.43419-1-jouni@codeaurora.org>
References: <20210722102054.43419-1-jouni@codeaurora.org>
To: Jouni Malinen <jouni@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-Id: <20210928131717.74C9FC43616@smtp.codeaurora.org>
Date: Tue, 28 Sep 2021 13:17:17 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_061743_585662_AFDDF6E1 
X-CRM114-Status: UNSURE (   7.42  )
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

Jouni Malinen <jouni@codeaurora.org> wrote:

> Add support for the 6 GHz channel 2 with center frequency 5935 MHz and
> operating class 136 per IEEE Std 802.11ax-2021, Table E-4.
> 
> Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

3 patches applied to ath-next branch of ath.git, thanks.

4a9550f536cc ath11k: add channel 2 into 6 GHz channel list
9d6ae1f5cf73 ath11k: fix packet drops due to incorrect 6 GHz freq value in rx status
b6b142f644d2 ath11k: fix survey dump collection in 6 GHz

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210722102054.43419-1-jouni@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
