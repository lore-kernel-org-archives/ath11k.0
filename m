Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34829C02198
	for <ath11k@archiver.kernel.org>; Fri, 14 Feb 2025 07:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P0N0X3RdIUpKTp5bovKhP0i6D22WIPGqOlaqXbJdgtw=; b=0+WJQHylYrFiOLEE7Pdfwq+WO3
	QGkGuAfpR/gSK+0TTN7e2NpgUO25csnoGflEibhxNzoeMA9kP8RNP28frPwvq/zHlGqHYFJyPemXV
	AfQkqIGeO3YmCVNulWiqp2c2A+o+9rprUto3yc4lYzkeRfAxqVfeJRpMl8gnnlcaKzs4Fjtqbcsjn
	9ytCnHRpwaIRpx/d0AB2FO/zg36h5MeAsqA1FzeDLX6TzF/zrCiU+rrIczHR8gZ+tPNLnMMD+AQe2
	CrJQSoHnfJwL+FAW2a1syuhQLpttae6qf16E4bld05syUG2Gb/tcrgJ9/CIrjOLtk/HpKdEC/cfT1
	2ETrRdsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tipna-0000000Dudd-2frG;
	Fri, 14 Feb 2025 07:07:42 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tipkt-0000000Du1u-2nLv
	for ath11k@lists.infradead.org;
	Fri, 14 Feb 2025 07:04:56 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-21f44e7eae4so31627555ad.2
        for <ath11k@lists.infradead.org>; Thu, 13 Feb 2025 23:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739516695; x=1740121495; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P0N0X3RdIUpKTp5bovKhP0i6D22WIPGqOlaqXbJdgtw=;
        b=cqfEE7jAwceJoYXvvVjWb1gOGwI9lRsJyxaYiict64OEF3r9bAqdNzolG592tZsbSJ
         zJRBxLsl8W8C+JCTctPg7FuKFXu1Acm9toigy6XD4LN5holDpPiw2u0NH92UmpYi8+k1
         NJfK/DBe6DZ0lwe8jYUjIAMSfk5JUfC2wqCzMVYLuxxTqLz4+4uCTmt6+pFEEORr4ljn
         6QwEqMLrlVqANc2zh4N6xype9gSV5qCxpjpVygNgbW4eDR2XikzJ3oSlsMJR5uf4HSG7
         uMeGDRwEpAKn66TR/j/3+RET+ojUxjXJbjU2IdZUz7eQO9wmPcrRpX4CAve4zfx3WRxK
         XKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739516695; x=1740121495;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P0N0X3RdIUpKTp5bovKhP0i6D22WIPGqOlaqXbJdgtw=;
        b=XY0P5Con/QGE+k8Qz/9zFrGTDVrb9zzTZiRx94xJ1gdoeZM7l9Q8H5DpKGLIq3Odk/
         qvvUp/ctLXH0PAy8Ghton4uWX+7AuGVvnN9/L1OL4iK/tbc77HWotb02FeCxDxtq6XuO
         W9PDvWr3aQQ2/UIxg+1Su5FF4cq9ggrD4AQAPFPTsD4OIvQhw44ShXn7sGgM6xN9Lvf0
         2Hzx/2+aznFf1PVb+ns1D5LrziyFIHMRRn87i/qH3T6lele4Y0sLFprld1ubcn+pyFTY
         g4jnPWiHDw27c+Tng/i5tHZUKCVwovJ1isfEpUmdnJTEHXZDbffOPE4bnwijKfV6CVOg
         LlrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKHJZoRNe/jzjFZmOiDrbDD3tH6JN29fasaLMvANzBjrdxbabzuO0Z9rKIBVrELvaPysjuiV4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6MkbtOPVUpHv19jf5IpPRyQKYeu5Xfii2lqJ1ZNn8TamEb5vp
	43onAyb2ta2xC93f2oaRupx9AYWNV7PZuR8FMgUAvDPLCdh4R9czeb2vi1rbrg==
X-Gm-Gg: ASbGncs3EQZSncQM3xb9Xdoi/LxBY6xqs4UJcSZ4jHXgarTgK1qrrQa3VEwlS8NPq+X
	lKnWmUTJRr8dyKK3p1aKnb91ciQlqrFxplFxtQ2FGgyRIu/3X1atEtx4ig3l8osdCoQbs07b4ap
	KbWNghl9w9nEwhVts+9MqitDAxgZ2y1kA4zqK3MviSpUvve9gMogCvD74C0wZySNXNFtLfAn6+b
	5fhcjVjx2BziQjbC/TL+Wc7JAibvWPXSCTaOwzsQgz1Q2V/em0vgpexQlGecBtb7e2TtJKFpZ0v
	dMtSEoVLmINII3Fo7lXRoQhwvyC4loE=
X-Google-Smtp-Source: AGHT+IGuqMZgZlagRCyTIKxDvOSsuvPGqcUxE8dosYx3w84r1nGN21q6LfaA+OlbApLZ3lRcHCSUbA==
X-Received: by 2002:a17:903:950:b0:220:e63c:5b08 with SMTP id d9443c01a7336-220e63c5e07mr59800745ad.11.1739516694826;
        Thu, 13 Feb 2025 23:04:54 -0800 (PST)
Received: from thinkpad ([2409:40f4:304f:ad8a:8cb7:72db:3a5e:1287])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d537ca99sm22711205ad.106.2025.02.13.23.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 23:04:54 -0800 (PST)
Date: Fri, 14 Feb 2025 12:34:47 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Muhammad Usama Anjum <Usama.Anjum@collabora.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Johan Hovold <johan@kernel.org>,
	Loic Poulain <loic.poulain@linaro.org>,
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
	kernel@collabora.com, ath11k@lists.infradead.org,
	jjohnson@kernel.org
Subject: Re: [BUG REPORT] MHI's resume from hibernate is broken
Message-ID: <20250214070447.scs6lpytjtecz3ko@thinkpad>
References: <59c036b6-a3d6-403b-8bb0-566a17f72abc@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <59c036b6-a3d6-403b-8bb0-566a17f72abc@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_230455_713859_43725E32 
X-CRM114-Status: GOOD (  22.53  )
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

Hi,

+ ath11k list and Jeff

On Tue, Feb 11, 2025 at 01:15:55PM +0500, Muhammad Usama Anjum wrote:
> Hi,
> 
> I've been digging in the MHI code to find the reason behind broken
> resume from hibernation for MHI. The same resume function is used
> for both resume from suspend and resume from hibernation. The resume
> from suspend works fine because at resume time the state of MHI is 
> MHI_STATE_M3. On the other hand, the state is MHI_STATE_RESET when
> we resume from hibernation.
> 
> It seems resume from MHI_STATE_RESET state isn't correctly supported.
> The channel state is MHI_CH_STATE_ENABLED at this point. We get error
> while switching channel state from MHI_CH_STATE_ENABLE to
> MHI_CH_STATE_RUNNING. Hence, channel state change fails and later mhi
> resume fails as well. 
> 
> I've put some debug prints to understand the issue. These may be
> helpful:
> 
> [  669.032683] mhi_update_channel_state: switch to MHI_CH_STATE_TYPE_START[2] channel state not possible cuzof channel current state[1]. mhi state: [0] Return -EINVAL
> [  669.032685] mhi_prepare_channel: mhi_update_channel_state to MHI_CH_STATE_TYPE_START[2] returned -22
> [  669.032693] qcom_mhi_qrtr mhi0_IPCR: failed to prepare for autoqueue transfer -22
> 

Thanks for the report!

Could you please enable the MHI and ath11k debug logs and share the full dmesg
to help us understand the issue better?

> This same error has been reported on some fix patches [1] [2]. Are there
> any patches which I should test? 
> 
> Is officially hibernation use case supported at all?
> 

Yes. The hibernation support was tested with x86 host machine for both MHI
modems and WLAN chipsets (especially ath11k devices).

> In my view, this path may not have gotten tested and can be fixed easily
> as we need to perform, more or less the same steps which were performed
> at init time. But I've not found much documentation around MHI protocol
> and its state machine, how is mhi state related to mhi channels support.
> 

During hibernation, the power to the device could be lost. But it should be
handled by the ath11k driver. Maybe the debug logs could help us know what is
going wrong.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

