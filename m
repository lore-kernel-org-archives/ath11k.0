Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936B5C3DA7A
	for <ath11k@archiver.kernel.org>; Mon, 19 Dec 2022 10:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K1Dv1GpdQkduMWkPT6jBjIUIDYLpSMF5zcvs2xmUM0E=; b=J/9Pg7OvLgt5Ki
	Ex+AlJTVxLIiCCaYSTB2uyN5x+JAbY54fy1yJYZHYS+T8Bd59lPtqKwx5k62S/JfYiWbwusSEfWmp
	H2ijVo4AretgxkL6w1vbN3ssxZki0MmaGWcX7S3FgTm5AFDKE0OpEevwEqX21EppLmIiDJQf80IEK
	bcEcRMBWmNfWaPwTbCtZAaR2t5cE/zhGP9rdo9qTbOsIKoWbSu5MZ99sw/jFRHfLFZc6a8hShK4id
	nNZ8mdlnqkiw9AQ9HAAwyUNB0x0GmKPHsP1tNaUTXs/AOkQoV3sptz6F+W2+VobYaW12LYISmYrHO
	4bsoTuhMTNgiVOQLFRXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7Dih-00C9MN-0X; Mon, 19 Dec 2022 10:50:07 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7Did-00C9GR-JT
	for ath11k@lists.infradead.org; Mon, 19 Dec 2022 10:50:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 54725B80A23;
	Mon, 19 Dec 2022 10:49:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12548C433EF;
	Mon, 19 Dec 2022 10:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671446998;
	bh=A3VkKPICWqmqnDaWN0cKcYEdoV07F+Y6/PeP1lQP3B4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TEXyOCFTTwkxGfxtAbp/Mky8Ihs6chDpXarV+fDWm7JW56Oz2H5Be0do4XSZpYFCB
	 N4oyRGf+QnQTUXlhB1jgmSW+Ewodhxod/O/7lF4DHf/ux71cg5LdEWiIPV3bz2VaO0
	 6qbUAzHMsFfkATUo5ihy1XCnX+gBTKFRH3/Z/jQkZlCGxCRib7u1Hwmome5ep6CByo
	 KSI1ojmlld3LriUmjyZe0yfcszlHTdvEDfnJVgFK03ZEeEz5T2rmZxPZ9DvOX1XVN3
	 oqO9DxcHwh71ucs0pjMBcnl4zWYBrmRHjCfaPIriJ4Mi8bvtKxBOLqF05vIsnlLSum
	 K/3QDUPn2VDGQ==
Message-ID: <f39cd52f-94d4-fe3b-a5be-8b27017028ed@kernel.org>
Date: Mon, 19 Dec 2022 11:49:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/2] dt: bindings: add dt entry for XO calibration support
Content-Language: en-US
To: Youghandhar Chintala <quic_youghand@quicinc.com>,
 ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221214121818.12928-1-quic_youghand@quicinc.com>
 <20221214121818.12928-2-quic_youghand@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20221214121818.12928-2-quic_youghand@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_025003_859243_D6A5DCF9 
X-CRM114-Status: UNSURE (   9.48  )
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

On 14/12/2022 13:18, Youghandhar Chintala wrote:
> Add dt binding to get XO calibration data support for Wi-Fi RF clock.
> 
> Signed-off-by: Youghandhar Chintala <quic_youghand@quicinc.com>

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

You skipped all of them, so this has to be fixed.

Best regards,
Krzysztof


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
