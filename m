Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C54AFCD1292
	for <ath11k@archiver.kernel.org>; Mon,  8 Apr 2024 18:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nm8t/x2uwmSp1PQu1GfRMMntuaVcapxgFKyhLMy4YmY=; b=CaJZvfP3S8grVF4XMoAY/ggI5T
	7oyxisn54pwsW+XikiRNbR01Shvmc9zV8xeupNHf8VxjrzTJb7ThLPgC+jUAY47NgXxXAe9nUMt6X
	JYTH6UBFyTvz9f6K9pY3+1F4LiHN0nukQrHJuTTsfecUenuI6WqXvtezi+BNAW7R557f52vaqMuaI
	wLE+AoJ/mLwrUJy2opqb07v4qhjwUhfI+hUw+OjKx8KWlRXWajvj9nhcgUlOO4eOHzaJ574lci8Ls
	1/1a23ZJ90WGnzhuvRebLleIv+5DWlcNyDPt+v0u3Qct9xUPa7Sl3+Ui2362bvky5I9+2FJ+7mtR0
	ww/eLfbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rttqV-0000000GVMW-0eIt;
	Mon, 08 Apr 2024 18:35:55 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rttqS-0000000GVM3-0oMf
	for ath11k@lists.infradead.org;
	Mon, 08 Apr 2024 18:35:53 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1e41f984d34so10751245ad.1
        for <ath11k@lists.infradead.org>; Mon, 08 Apr 2024 11:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=penguintechs.org; s=google; t=1712601350; x=1713206150; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nm8t/x2uwmSp1PQu1GfRMMntuaVcapxgFKyhLMy4YmY=;
        b=H5XFFDBSVUJE32Eo3MCkLGNkUESf1C26CP/tOV3a65ietD/v9hJu4GwhfjwQ8OILjz
         PpLxYP0tzcFdTyHb8RhXJzpQTdh1zm+otAMWLG4/w0K8eCCmGWcob75wzoFpGSBxI5Vx
         xZDkbA4kPbPSPf31ixfPRszMnt2oj5qXa+PB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712601350; x=1713206150;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nm8t/x2uwmSp1PQu1GfRMMntuaVcapxgFKyhLMy4YmY=;
        b=teKW2oGaCBvcN89v4Zd1zgfydoEQN67jlSif982B4SFmoxGdX9/LAZE1zvjnRUSweT
         5r+N639trlsN6HcaQli5EkYFf3ylzTH5/B8Z1+G0Vo4YZFtVQBMykJ5BTS8wpYgV2Z1E
         tH7skdEfW4d9W6OeRrEZiR3OqJQn5K2RyLkcXEuZIa+P7VUdzU+UjgHjD+Udphwsw9Dz
         AVTctKA826QO8LIcaf6/WbPfFRg0a3lsXzmQNMAjP2x5WozTRgfRYBI281sF3ExwOgOg
         LkISajrA1ewZy5mIaCL2cFUUJ00s5LOsq7l6UhQcKHysDhdsRFJqjmrfVxfu9w2nZCJ7
         /Y1Q==
X-Gm-Message-State: AOJu0YxKugfi/aYn4w8P4r1YXtTmVma3GIQ1g+eBh2cxOtYJkqfdgVx0
	H/LM64eh7nu85ShPH3pnLeWM/SGbcsbcd9qXKm9i3UNtQMTWBhRRKbJ0XMwcBA==
X-Google-Smtp-Source: AGHT+IFfnkAR7C9SXUsEI1m9SG5HvTsx7iGg0BYwfHhXYsFcaNk5AN/AUuIyVkavDJsczeKsWxqukg==
X-Received: by 2002:a17:902:a386:b0:1e3:dfdd:21c0 with SMTP id x6-20020a170902a38600b001e3dfdd21c0mr5723950pla.27.1712601349724;
        Mon, 08 Apr 2024 11:35:49 -0700 (PDT)
Received: from ?IPV6:2601:646:8700:dd30:5f3e:5ba7:e0ea:9a08? ([2601:646:8700:dd30:5f3e:5ba7:e0ea:9a08])
        by smtp.gmail.com with ESMTPSA id kj8-20020a17090306c800b001dd69aca213sm7340841plb.270.2024.04.08.11.35.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 11:35:48 -0700 (PDT)
Message-ID: <99e404ee-81ca-4dcc-811f-9c55fc52c551@penguintechs.org>
Date: Mon, 8 Apr 2024 11:35:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: QCA6390 bluetooth doesn't work after warm boot or
 disable/reenable
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org, linux-bluetooth@vger.kernel.org
References: <a03dace1-ca0f-41d6-8e2c-636e3b053a3a@penguintechs.org>
 <31bb6e18-ecee-49b3-87d7-50ab53e07447@penguintechs.org>
 <1b3d3937-6679-491e-a5c6-818ae8ac639a@penguintechs.org>
 <87sezwjums.fsf@kernel.org>
Content-Language: en-US
From: Wren Turkal <wt@penguintechs.org>
In-Reply-To: <87sezwjums.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_113552_500093_AC030D31 
X-CRM114-Status: UNSURE (   9.75  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Thanks for letting me know. The wifi is working great. Thank you for 
your work on that.

I doubt you will have time, but if you do have a chance to test it, that 
would be amazing. I would love to make sure that I am not the only 
person having this issue, if possible.

Thanks,
wt

On 4/7/24 10:22 PM, Kalle Valo wrote:
> Yes, I still have that laptop and I use it as my daily driver. But I
> don't use Bluetooth and I don't even have the Bluetooth enabled in my
> .config.
> 
> BTW ath11k is a Wi-Fi driver so most likely it isn't affecting your
> problem.

-- 
You're more amazing than you think!

