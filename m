Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D290C636CC
	for <ath11k@archiver.kernel.org>; Tue,  7 Feb 2023 10:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8bSgNIEEtjYYybbX3wMp3daLVh5SwQwHeEx2YWwm1mc=; b=c7jsYT0zg50Nub
	UP4IuQWOwYV+ZcM922ju82xHSr1MTlMOnt+seUia2mpJj+rrSqE0FuMYCsUQYbJU6gsOsSxOuzEkn
	zlWvBQnyfSlFhgyKbt+gWJ1n4pjUhYyWMpOqLv3MykumpyJ9FX1nPYQX2tfFNP2viWrHT8kfQXtc3
	SPIJIGmZRS2MdydqqTF/P3xxLUg7yJd78ttolrigh2yOiKvyYulEF1Ls2tX500w1J1AXNMDscVLJR
	TrqV/pzFjQkqq4wpJEKBfh6TV3blWVcYJ+GBu7ty855KAsn463jNGvhsK2C8tXB7BnQi4WjCa4EJq
	lUf17melDGhjfZ3/9iPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPLNH-00BktQ-Gi; Tue, 07 Feb 2023 10:38:55 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPLNF-00BksE-8F
	for ath11k@lists.infradead.org; Tue, 07 Feb 2023 10:38:54 +0000
Received: by mail-wm1-x32b.google.com with SMTP id bg26so10722025wmb.0
        for <ath11k@lists.infradead.org>; Tue, 07 Feb 2023 02:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4lFvnNUEfmFOZfC45OwvN3PFMk0fFsXufSpzORMwHDk=;
        b=EDxzu3TsCDNriK0w84Lk1nw+1AacJKCVYQf/T5G5+W4VcReJW6LHMqspzdCN8XFBhM
         Esm0DmEjb8XJGxHv9CiXEKYvhiY0GsW08xyGl7izi1HmeWxF4RJVJUdYRYjTx0Z4F0AV
         h4uocSKdFbqP0fuJbflEBWAliE7VPwf8R55x/qvS906+9Ij3d+8SEEhQR9GCUXDNHVJy
         El8L4lc0pOUNfjRVszr5zgLgGNxivA5YV6uYsdLF+ywgMgNlvtU+uY3zq1ultazVANqH
         Yl/OSk7aOqNvolpM01EiDUEi2X52i3aFPBigRXtIpdBvYHqA5j6O20SsDytYHZ9sg6G+
         7B+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4lFvnNUEfmFOZfC45OwvN3PFMk0fFsXufSpzORMwHDk=;
        b=G8JAPmyWGT9byHXOE9I67xa22iBYRuTyWVGimOWAHLRCl1jO8mjy6kiYcyihRT/u6Q
         K7r6W/A74cBromHfb9Dsjg02bQP6s8/dHj2SVdYfpPWB+34hZeJ95Ew9IPZq17Fr14BN
         WjwqRCEuu2LhmR75+NJ9IbC+tyl1dgxqWf9tygKc/DP7qD4g2KOSeWlDoMPN/N3n0Iik
         f+EthoU+VbpQmGOah6uQ5z724bjpSbhM/eH/GyI5cccbY6jAlYgBpMB3btGCYhLeXf1w
         QZxjsBhua4WU5huoLBFhEggbaFXCMG4Ld9+VuhCW3pKlsYKuCArDo9uyfVd03G49mKNU
         7nLA==
X-Gm-Message-State: AO0yUKU0x3VKlUMKk8xs48Qa8R7dlSDfj2eceZnR3cX+CazVgS2fMd0G
	4DY00SwWf/211nG2tSw4vESZyA==
X-Google-Smtp-Source: AK7set9EA70AZrV3ayvDW+3CXaJxEpJLLXtDp/TCoH8Algcq36FWfYcEPeGEadcXYAC4a1d9kulBKg==
X-Received: by 2002:a05:600c:4919:b0:3df:a04a:1a7 with SMTP id f25-20020a05600c491900b003dfa04a01a7mr2731579wmp.22.1675766332065;
        Tue, 07 Feb 2023 02:38:52 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t6-20020a05600c450600b003dc433bb5e1sm14444330wmo.9.2023.02.07.02.38.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 02:38:51 -0800 (PST)
Message-ID: <4fb45056-3004-b68d-06b7-b4109e813c51@linaro.org>
Date: Tue, 7 Feb 2023 11:38:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 1/2] dt: bindings: net: ath11k: add dt entry for XO
 calibration support
Content-Language: en-US
To: Youghandhar Chintala <quic_youghand@quicinc.com>, kvalo@kernel.org,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230207103607.12213-1-quic_youghand@quicinc.com>
 <20230207103607.12213-2-quic_youghand@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230207103607.12213-2-quic_youghand@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_023853_330049_EB1818D8 
X-CRM114-Status: UNSURE (   9.95  )
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

On 07/02/2023 11:36, Youghandhar Chintala wrote:
> Add dt binding to get XO calibration data support for Wi-Fi RF clock.
> 
> Retrieve the XO trim offset via system firmware (e.g., device tree),
> especially in the case where the device doesn't have a useful EEPROM
> on which to store the calibrated XO offset.
> Calibrated XO offset is sent to firmware, which compensate the RF clock
> drift by programing the XO trim register.
> 

And this is second v3 and still not fixed. The same as previous v3 and
previous v2 (???).

Best regards,
Krzysztof


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
