Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8839BC61CE7
	for <ath11k@archiver.kernel.org>; Wed, 11 Jun 2025 04:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FE1cAWbg11FBslkXTnrUJG3ETee3kwzfdEhvTNzCUjg=; b=IuBLSPtlLnFEchXqy43s3DCS3C
	Kq+/nKlEtAaZD3xVeu98g3/2VtfzB7K5ATsRNtjms9Q/oC8/e7Tc3/mhT/W6vhTHQqQcU81pc7eJ6
	4ETIHLVPitbF7URXinkcPf9wDwWribAiAUIjkSt7VDOSRJ+vm9CIQhiOY4M2VR4t5qWeTkqeCKILH
	M1gXuiK6+kjE7+eE6vR2TrtTSAZ0T8PsvNeo9houf2rks4q1+81maIM5fDUlCHYkkxY3gdLMA1Af+
	SE0TzTG9X6KWamG3+fLdYkKl5N5on8GblC/ZKz6ERIPxIU4TFVvY+agOsotCU3nRxJkLGsCfIje7o
	1cnyFA/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPDDl-00000008pgb-3uFf;
	Wed, 11 Jun 2025 04:37:53 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPDDj-00000008pgH-3acy
	for ath11k@lists.infradead.org;
	Wed, 11 Jun 2025 04:37:52 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-234d366e5f2so70630735ad.1
        for <ath11k@lists.infradead.org>; Tue, 10 Jun 2025 21:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749616671; x=1750221471; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FE1cAWbg11FBslkXTnrUJG3ETee3kwzfdEhvTNzCUjg=;
        b=YU+z2pLmcvU5I3pB7Qf/FGTNPztRkhdKWxZCHuaAEPAbfdbORRS/BjhS+WmGPODcUs
         OV24t2aA0edYYjhJ9a057+k/OhnXUMXTWmEEtui1dn9BZnbTr66xlaVpYmmJ129zDABh
         eDzT1HIeHFl0Wt9kFyhqZRCKlb5Wm0pJG9sH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749616671; x=1750221471;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FE1cAWbg11FBslkXTnrUJG3ETee3kwzfdEhvTNzCUjg=;
        b=WBmSiKamFtR3K1ICgu8JhfnOK/0Uqja3YO/ZtfJQdK4ByZluk7dDQPk6yD5HNOHAMn
         6NqJOgPgGRgKavoiKXgWqrlCS5wam/uT1ajeXbS58gDYLGj3HagKI5cK9sjSw/IDqiOx
         gXXlLjyvFh9ofZKXlJdg2A/aMZQ1bRKIWcEEk9padAjKQiDiJFIyWcos6Rl5qE4OjfDn
         hOUlqiXNcN65yTd/vY0lsttm2KQAiJAcqsu35I7sfCfMyeXvmaQ67bcmFsmEdimcnQF6
         w6dtTUEcH/a5dnnQVPwUC3tCL3ZNdNXO1CdY+FjI7xZviC1KuDT7WTOYPV5Rk5q+93Kg
         D5mg==
X-Forwarded-Encrypted: i=1; AJvYcCWUTSRZoNDNgGmWd0Fml+ireXYZb5PvPhpe4GYBYrXq6z9NxogwSDb8wRXRhMJhgAR521bVuu8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzEYJK2YOwVFRYGbwY2Gayo0JbFGYWI4vmXqH8rGpcLncRUp4jr
	tQSAcLhtgDAV9PtlPl+NbnAs96DqrTj31zlInXwDgU0GLL+xfNdACXEPxhNXgpH+BasX1DJ8Ggd
	nqho=
X-Gm-Gg: ASbGncvZYVofzS+KDKsI9as3qI6ScGQecpqmuJT+zkisfC1+iSudhbYACeWud0dR2Rt
	I8Z544vMbRWa/8tkVq2WaJgfTVVnTrd1rzs6Nxg29gVjOYIK2AmnMzrR48Bj2FLdnu30PXLgwz6
	T/a+mv9ABAuBKgdZohvii9ufHdwlS4+qgpA2UGHoeEwBp14Hhanwc+cV6Z8SAgSvM5oU0aNYd/C
	jL4yqWrHVarFkiP3O1bVY5YdpDuaxXV+HwIZ+AKpUB7GWOFQZCGEwsRtNS5EWjN047UqK44kmRA
	/rG3fGy2aSeP6593hwvS/l919W8je1AW1uk0tOL+51NfaABYX8hjDuNYiB/8PQGm4SymKgYt5w0
	a
X-Google-Smtp-Source: AGHT+IFM8NgLpiLIoUkojJ3i2pht8cBR3G2XAm5m39HTWlGcYeBr0M+6D9ErnNi2+LitOkchPJZG1g==
X-Received: by 2002:a17:903:32c1:b0:235:a9b:21e7 with SMTP id d9443c01a7336-23641b2654bmr26834905ad.48.1749616671102;
        Tue, 10 Jun 2025 21:37:51 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:eac8:ff09:e566:df3a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603077eb7sm78450355ad.39.2025.06.10.21.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 21:37:50 -0700 (PDT)
Date: Wed, 11 Jun 2025 13:37:46 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCHv2] wifi: ath11k: mark reset srng lists as uninitialized
Message-ID: <74caimlaibla7rge2eoiubeesp6pz7e6u7ifvbw57t4e6q4qso@iypz4pqd7kpr>
References: <20250529035708.3136232-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529035708.3136232-1-senozhatsky@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_213751_935845_B4330A66 
X-CRM114-Status: UNSURE (   7.25  )
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

On (25/05/29 12:56), Sergey Senozhatsky wrote:
> ath11k_hal_srng_deinit() frees rdp and wrp which are used
> by srng lists.  Mark srng lists as not-initialized.  This
> makes sense, for instance, when device fails to resume
> and the driver calls ath11k_hal_srng_deinit() from
> ath11k_core_reconfigure_on_crash().
[..]

Gentle ping.

