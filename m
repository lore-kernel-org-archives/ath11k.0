Return-Path: <SRS0=q65b=NO=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D600C4338F
	for <ath11k@archiver.kernel.org>; Mon, 23 Aug 2021 16:17:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47BD7613D5
	for <ath11k@archiver.kernel.org>; Mon, 23 Aug 2021 16:17:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 47BD7613D5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=penguintechs.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/eFT8h9B52QBtZKnbusaaTdz3b2EO+1SGnjLC3uomsc=; b=22sgHc/uMMTtcpd5fVl0mc1Lq4
	f6gbikXEkQNuWFlPf+marnM3grFChujUqsoZFHcJsY0nLhQx2dZVKnzmlbevmRZCRkW83+aZ6Url+
	Cfh5P5K4CquaVsqWvdpFw7x5Qt8hvUfKWvNRWY6ibk8Y7X3Sak+eV/dBW1Vlly4UcwUrfqSICyhgO
	dLRxqN5+7WF6gd+jMdS7CvuznFfJ0Swcix1vKXSCFtn9tEm1r4chuvVxqltSt85tP4Wv8ZMGUUtG0
	qmXEBZDJyo/vt075qZZCMs78jsUH8ZMSzznAiMafww6Vm/wHY3pjuZzN/ltLdgv9FpOUOLqbHB69i
	92UBT0nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mICdd-00HZQp-7f; Mon, 23 Aug 2021 16:17:29 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mICdX-00HZO0-Cy
 for ath11k@lists.infradead.org; Mon, 23 Aug 2021 16:17:27 +0000
Received: by mail-pl1-x62c.google.com with SMTP id n12so10469612plf.4
 for <ath11k@lists.infradead.org>; Mon, 23 Aug 2021 09:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=penguintechs.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=D1vc0Du1QRW2K7m2nHISIwEFAgR/2yZeAXrP2XUTUTo=;
 b=TTf1KxFTr9AaSHU/sjS+bu71irZm+4W1oB8XVgfBcxuzm3nzN40bA6iQuoU/XCvj1K
 zjiVgWBAPnQSESV0TdfLbp0z8WPY0umBWaRB+eVPT8VkgVhNWKfy3I2t4jcWduZz9fkQ
 +eSNsygoa/t9g/n2f4M4LkK3GEfRVelJC9W24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D1vc0Du1QRW2K7m2nHISIwEFAgR/2yZeAXrP2XUTUTo=;
 b=VtolQhBWCywbyhxSJU1axLuUZHITiATd77ZLiHMHMKhOb+/2JIZFI5l1VlK3bEcbfK
 o8WB+YxWkqcJ7GZWX1wQXK6YDkhXdvFwJOtCkiGUMeegaDaCcXKonkXkQj/i5P7dfp2u
 GRD9bBlH4LfTcsbuX4e3Ebos7TWgP+g4qBPdm1+b7go7h1mRWy+LBeaFyupD/wz5SZN2
 ZZATFxEIs1DHcsOYJdbsPVumrUsJlUJK9sxrsbDRZ01+a4LP5EdnOpgXlPxTmXHtYsRs
 aN0Gj/cWcLIgxabxCxLO/S5mRmD+QYWhIzRpXMitkAEQ5ezoALIs5nKp2ULEymoR75UQ
 O1rw==
X-Gm-Message-State: AOAM532RJTw4ZpxRWspqz/vd1t8Y+TfPMGCh6jTZVMfdpHeFThzo6CWd
 1kn43PfgIa0vXzgDSJlYX970Mw==
X-Google-Smtp-Source: ABdhPJw47ln4dJxLu524q5oWrRuKZ39R/vavsLyK8rTDU02DD5CkulpAi+I+gx5ZjNLR0Phs13miQw==
X-Received: by 2002:a17:90a:4409:: with SMTP id
 s9mr20665276pjg.125.1629735442052; 
 Mon, 23 Aug 2021 09:17:22 -0700 (PDT)
Received: from braindead.localdomain (c-71-202-115-154.hsd1.ca.comcast.net.
 [71.202.115.154])
 by smtp.gmail.com with ESMTPSA id b20sm19580946pji.24.2021.08.23.09.17.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 09:17:21 -0700 (PDT)
Subject: Re: 5.14 rc6 broken for QCA6390 on Dell XPS 13 9310
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 regressions@lists.linux.dev,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Hemant Kumar <hemantk@codeaurora.org>, Loic Poulain <loic.poulain@linaro.org>
References: <a8cddf24-ecfc-088e-27f4-98cbbb5fb67c@penguintechs.org>
 <87y28sqq4l.fsf@codeaurora.org>
From: Wren Turkal <wt@penguintechs.org>
Message-ID: <d2795e7c-69cf-557d-19c4-f800c3a80997@penguintechs.org>
Date: Mon, 23 Aug 2021 09:17:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87y28sqq4l.fsf@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_091723_559451_6C18384A 
X-CRM114-Status: GOOD (  11.89  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 8/23/21 5:53 AM, Kalle Valo wrote:
> Do you get the same mhi error as in the forum post?
> 
> qcom_mhi_qrtr: probe of mhi0_IPCR failed with error -22
> 
> MHI folks, any ideas? I have XPS 13 9310 myself but I'm not able to test
> v5.14-rc6 kernel right now.

Yes, I get that same message in my logs.

FWIW, ath11k_pci now does not get loaded on boot. I can manually load 
it, but it doesn't seem to do anything.

wt
-- 
You're more amazing than you think! ymatyt.com

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
