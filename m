Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7885ACE8D5F
	for <ath11k@archiver.kernel.org>; Thu, 19 Sep 2024 08:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gELVqvyqcJInyr8E7hFzpzkNi+tcnEM+7zPPHqXS8a4=; b=UvfXt8L5I6CCE08DgsceCGvXzL
	KurwVxMrRImtQG9w4TxqMPVcT1r03oN0fhHwdijporc2KQjKtro1b9mtHPBdMDmfYqAMz+JtoRSN0
	CrO+F2VqajEFxMN1SZXrVvYzerzPwkfDTBGItfrYdptdYrwFI1c86rLjRXMgTqGUmAoTz1YvMJVc2
	yCeYRLM+o5uhpnLDpbodqbSVnQavCkQnM5PSIBXl4ixdA0fVX6yJNzlYjUDf27VTkY5/lOu4OcKVG
	0mJG6HeVfRwYGEEbWJdIHo331j+VxHCktFpZMdYy+9nP1P/Q0TYByzGdHnMBkoEjmPsnCPE4tJ12E
	E7aA48rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srD0W-00000009quV-0phB;
	Thu, 19 Sep 2024 08:59:24 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srD0T-00000009qt6-1NIx
	for ath11k@lists.infradead.org;
	Thu, 19 Sep 2024 08:59:22 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-718da0821cbso424897b3a.0
        for <ath11k@lists.infradead.org>; Thu, 19 Sep 2024 01:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1726736360; x=1727341160; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=gELVqvyqcJInyr8E7hFzpzkNi+tcnEM+7zPPHqXS8a4=;
        b=r9lHu+AKGYkPrqdxTuD4bYcRlYNRKQ01GM1ercxO6TZ83tQwO7gxaV/DQr5UyE0jZP
         obBkAgS5UP5sPVWYnbAvnCG/MSh5DKw2jlioyElAgMXc8m3kwNSkxYvXsZrJR0DUe2rI
         /yxpiT8qHlnaqj+EfpddFz/s/5KzLASYkJH4PZqnVtjGEohrOy/vi1kpvoo4QOUxquOL
         JPdo5JnyXx3HY3rJKxHM8+vb5ZebjO+hEYHOkR07sPrA/7evYjVj4P3d+RerOFIi9Xdo
         BwOerHySBea7/MjMt/zQZtgWe1TxYg1j18Cd3KASIcYmyAyOT1QR4cUr2D4W6AfpeRnV
         Rz0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726736360; x=1727341160;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gELVqvyqcJInyr8E7hFzpzkNi+tcnEM+7zPPHqXS8a4=;
        b=YB0NKQs1w8LBNruzHCqzdl3yK8pPC9iFn9RJ19Dmh52lcr1olnS9Ozz40xCon220N5
         WLnzDSy2A/m2ATjUTJxNE2bIWGDu3kLzgEucqZCPKb2+NKjulSitiTvw2ErWGtDQ7dQy
         g3aZB11MDOPpAugAxOHrJ7+UX1PdqdiEwhnSW2amPqvz5iGRNjHowe8Nh9T/SNlEro3U
         LS/1WFWXjklzQDGadr+TpbB4wCy1zYSQJGK6W/t4iroQDtdn7H/gPvC6rg29TB/U/iPm
         HeXDbBnkrYsMDnN2aYQ/t4yObtrJrWRAeqZUEmvuXBMFegILQb8coig2ztCeAxxv/jRM
         a5hw==
X-Forwarded-Encrypted: i=1; AJvYcCV6hYgJiieNsYVoBZ96rGdUK9K/SwOMLat/lFmE6sBfUlaiXD5OwK5b390l5uWZ8rgoXtjTgb8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw45ie2Vtb9MJr7AEmzqzpZ0YD8T+F1544oDD1QT269qqs5LVtq
	xLPbor9XKwM5mGWlTsfloyKjBfptRFlUNNDmJSk8KrHY8BDSRFCODw0EjTXMx22xoYIm8Rjzuik
	78w1NSCzK/uK+HJzolRp5nTyU5DHAL4rPimrzSA==
X-Google-Smtp-Source: AGHT+IGvZKhZ+sgK1EVS1v43hs165nAjaXCVBqA4ql8mlkaKawbV4Lhi2ui4b5YR+NQKc/pd5URgnIZnstCpvwceHIs=
X-Received: by 2002:a05:6a00:c88:b0:717:fd98:4a6 with SMTP id
 d2e1a72fcca58-71926082587mr37728842b3a.11.1726736359963; Thu, 19 Sep 2024
 01:59:19 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 Sep 2024 03:59:17 -0500
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <87msk49j8m.fsf@kernel.org>
MIME-Version: 1.0
References: <20240814082301.8091-1-brgl@bgdev.pl> <83c562e9-2add-4086-86e7-6e956d2ee70f@kernel.org>
 <87msk49j8m.fsf@kernel.org>
Date: Thu, 19 Sep 2024 03:59:17 -0500
Message-ID: <CAMRc=McEWWm8N++4a5LMCAa0GWsQdi0KuSpj3ZuS_he=H0LP+w@mail.gmail.com>
Subject: Re: [PATCH net-next v2] dt-bindings: net: ath11k: document the inputs
 of the ath11k on WCN6855
To: Kalle Valo <kvalo@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	ath11k@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_015921_549694_32197A44 
X-CRM114-Status: GOOD (  12.49  )
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

On Thu, 19 Sep 2024 09:48:41 +0200, Kalle Valo <kvalo@kernel.org> said:
> Krzysztof Kozlowski <krzk@kernel.org> writes:
>
>> On 14/08/2024 10:23, Bartosz Golaszewski wrote:
>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>
>>> Describe the inputs from the PMU of the ath11k module on WCN6855.
>>>
>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>> ---
>>> v1 -> v2:
>>> - update the example
>>
>> I don't understand why this patch is no being picked up. The code
>> correct represents the piece of hardware. The supplies should be
>> required, because this one particular device - the one described in this
>> binding - cannot work without them.
>
> I have already explained the situation. With supplies changed to
> optional I'm happy take the patch.
>

No, silent NAKing and needless stalling is what you're doing. I responded to
your last email with extensive clarifications. You're being told by the
experts on the subject matter (Krzysztof and Conor) that the change is correct.

The change has no functional impact on the driver code. It's also in line with
commit 71839a929d9e ("dt-bindings: net: wireless: qcom,ath11k: describe the
ath11k on QCA6390") under which we had literally the same discussion and that
you ended up picking up after all.

Arnd: I've added you here to bring this to your attention because it's somewhat
related to what we discussed yesterday. It's a change that is very much
SoC-specific, that has trouble getting upstream due to the driver's maintainer
unwilingness to accept it. Is this a case where a change to DT bindings should
go through the SoC rather than the driver tree?

Best Regards,
Bartosz Golaszewski

