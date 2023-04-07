Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72124C6FD1D
	for <ath11k@archiver.kernel.org>; Fri,  7 Apr 2023 13:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VAApbNxTa6wP1mF+3TKjT7QUb2sl6EOLeohpstptgRA=; b=nSp+gtkMiwBcIC
	dyzprchbIp9yRWkxYVl8LQ2TeCOK1LV6+YFkA10DnUtxCJcUC7QSpUopcwQYf6w/T+aftIwz02/Vp
	RgmCDRr6/KgCX3CgWH7vVNg00ldnK7iWzKIZ5uCs6DLvUI7JHtjLFSNrj8OaPJl7JR8g7tWUJSJFj
	MZl2eF1YI6/5C6AWVzzLD9ldNQYRxUIkeszhJlWWrqQBEg8OnYNkkA1cuaFRnayjOadfXVvmZ+HP3
	p5gNrL6QDYz2XLP9Dm8EXlXCUQLsc9ibaLEscW/5K2/bMQn2ppXnccJttkDgQMdL1UjSmI0nohuWu
	cNxthlyErg+awKNzSwrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkmFP-00ALqE-0A;
	Fri, 07 Apr 2023 13:35:24 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkmFF-00ALo9-2m
	for ath11k@lists.infradead.org;
	Fri, 07 Apr 2023 13:35:20 +0000
Received: by mail-lf1-x133.google.com with SMTP id g29so4655699lfj.4
        for <ath11k@lists.infradead.org>; Fri, 07 Apr 2023 06:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680874509;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DtaBXHMta717GpCuZ3wh1MM3SKnnue8iRo2CuX4LyJA=;
        b=C0uULR956DWUq4yyn2ojN4NMe/JEa/qkhBvz1mLHZE6E+4OeYapJs8wBgvf5rYVHtk
         UVurRhKyEk/mgh9qfmZ6QceyEzX0j28/3OxWegln1vq21BCdqGmGpUFXRIRX9hwx9ON6
         AwoQND2MnjFVeaCtDTwz4U/1c/mHlwdKeQ2a3tV6UTtB8N6dOJsEPcPTJGeXmcBYY1d0
         OjRqYk4EabZgIb01qL/Hw29ccVkBaFEwx/tkRsSLAAHEiFkAM/8warC7bd3w64WLwB8w
         sep9+WlkXlS/dVBOHk2RBGfNW6fIvCE1ZoHCbrYJ2z81b7T1XKhwBuk2NxB1phNK5f52
         cScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680874509;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DtaBXHMta717GpCuZ3wh1MM3SKnnue8iRo2CuX4LyJA=;
        b=geP39EtRlDLObt6b09nEiVIFybhedz4agkxqIWuyogPVA+wADMD1OXa2jXjKJBRhEc
         6vW9le09vJi8JH7Ylh7aLyG0qRwzV7niW4z5DhgUvZRntIWgzrcwQ7EHlIcUqHmthqwB
         gV/afZerdVEwW7+rMW56YPPmSpIIqezseGCZNZDKTeaq4urK/uZi7Y/m5sAghBF40YYS
         ehHVyO4EfI9+hFwvgOCURbOw0+uiIjpVFDW4NgYbWqfYC0PMDGJ/xUiHXN2RF/yrhYfj
         HTzdXLWGSQKTb33kUOyZPPJPKlKcomTZifeY7RwNWMWioax2ixyOIMdB4D9q+zNFCigI
         S9pQ==
X-Gm-Message-State: AAQBX9fzmJa+Wc1eUyWEcQbL8Fho/m6PCy+uRUMrt/gTvm8Wi4qqxmnF
	PHXXZe9oCAC9i0+8pBEskD4EHOxPGCQdGIJVoA4=
X-Google-Smtp-Source: AKy350aT0DmwbnnqzrraNugNo0+iMi/Li4QQ8L+y+1QlEdcYad0HE/PkOOlJ6OW+ED8Ingr9/fcD8Q==
X-Received: by 2002:a19:f817:0:b0:4a4:68b8:f4bd with SMTP id a23-20020a19f817000000b004a468b8f4bdmr706625lff.3.1680874508840;
        Fri, 07 Apr 2023 06:35:08 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f14-20020a2ea0ce000000b00298a81f3184sm790704ljm.100.2023.04.07.06.35.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Apr 2023 06:35:08 -0700 (PDT)
Message-ID: <8ceeee1e-8828-69a9-facb-20c3787207bd@linaro.org>
Date: Fri, 7 Apr 2023 16:35:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PULL linux-firmware] ath10k & ath11k firmware 20230405
Content-Language: en-GB
To: Kalle Valo <kvalo@kernel.org>, linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 ath11k@lists.infradead.org
References: <87cz4ia35m.fsf@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <87cz4ia35m.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_063513_955223_1790D1E8 
X-CRM114-Status: GOOD (  11.28  )
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

Hi Kalle,

On 05/04/2023 16:07, Kalle Valo wrote:
> Hi,
> 
> Here's a pull request for ath10k and ath11k. For ath10k we have lots of
> board file updates in multiple hardware families. For ath11k we have new
> firmware branches for QCN9074, IPQ6018 and IPQ8074. WCN6750 also got a
> firmware update and WCN6855 has board file updates.
> 
> Please let me know if there are any problems.
> 
> Kalle

Excuse me, a gentle reminder regarding WCN3990 board-2.bin. It was not 
included into this pull request.

> ----------------------------------------------------------------
> Kalle Valo (12):
>        ath10k: QCA4019 hw1.0: update board-2.bin
>        ath10k: QCA6174 hw3.0: update board-2.bin
>        ath10k: QCA9888 hw2.0: update board-2.bin
>        ath10k: QCA9984 hw1.0: update board-2.bin
>        ath10k: QCA99X0 hw2.0: update board-2.bin
>        ath11k: IPQ6018 hw1.0: update board-2.bin
>        ath11k: IPQ6018 hw1.0: update to WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
>        ath11k: IPQ8074 hw2.0: update board-2.bin
>        ath11k: IPQ8074 hw2.0: update to WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
>        ath11k: QCN9074 hw1.0: update to WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
>        ath11k: WCN6750 hw1.0: update to WLAN.MSL.1.0.1-01160-QCAMSLSWPLZ-1
>        ath11k: WCN6855 hw2.0: update board-2.bin

-- 
With best wishes
Dmitry


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
