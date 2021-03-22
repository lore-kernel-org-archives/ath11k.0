Return-Path: <SRS0=owuj=IU=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 243D3C433DB
	for <ath11k@archiver.kernel.org>; Mon, 22 Mar 2021 20:37:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C171461992
	for <ath11k@archiver.kernel.org>; Mon, 22 Mar 2021 20:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C171461992
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Rr3ohlhvs/Fw0PAVigcK3sPvZSHdrxzzrzRS1i8fTFg=; b=YrIhPr/coF5IQowCeh+yPq8HF
	NTPQYOAgk5iuTJ1ojCtNx0AwFpi7tjxhhdTbKzxmCMpLmXmiynZs2chgtY8j/GIVaXdLr3gjIau75
	/arB3D5SE61jDF2EEULMBbX0B4C0FAS3FLKxtt6vZtIp7gOGS4dKaJvGaqdXERab/kPk6JsrrT3gM
	LgZ0aT/7ONGfC7dxRlnutO+hE0Lj1LYspcVrtNCWhxOPGQeLrKp52YTWsQRjkx1MF9gHncOvPb+JP
	dSCSYrxvcI0+k/NdRnw1HQiMOaZiAvXc4ruWsZZZYvavonCqnar2pNWDHS/5SCvmjRUYXHwzkjVcA
	6PNxBPFwA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lORJ3-00CWEb-Un; Mon, 22 Mar 2021 20:37:46 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lORBl-00CVif-Hy; Mon, 22 Mar 2021 20:30:43 +0000
Received: by mail-ed1-x532.google.com with SMTP id bf3so20991602edb.6;
 Mon, 22 Mar 2021 13:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7QH2qH8OXw7astC9J+hBZNIvd5jFa6HOZzbSlRf+8Ek=;
 b=T8MfESZQxe3NObZ/7MqvvJi28NxxdFf3ab07gERPhzLT804c2DkkhJkBMdizuiX7N5
 CHF46uFWWZ0cEHLJOYnXTiyTVv5tLvjO1lmS5Ohg2XPP88nZmWW9F5ARG6cD601rZ5/K
 zoiBTqPm5H0nLHbAPcra7yZ3RbLdPm8oZKbWma9nQPHRlRk5CMs6B2AjWWGtpKPrvkGd
 rL5fFWVmWmq+K/IWUKd2YrrT8XNdUQvFpqJ+tfEUQNjkhvUoBFoAG9jEiozLdABWs7F1
 P6ZC1gmMny9VZsWnwgXXF/Dsydybb92YeAKNqz04oOvYAWJ3XKyrs6O1pidMSVkxvnmE
 iM1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=7QH2qH8OXw7astC9J+hBZNIvd5jFa6HOZzbSlRf+8Ek=;
 b=BbfswR8kaNd6e8ai22t7zrDDoLOPqy7bcNn/zYL6vrLM66drs609Wg+n325xKzGdZi
 LEDzdCYVCMI7ubNvdCooU9oGtMKLjNGPj0Dt2QrfIAoiabkfIBsYDzNsQcXjuHdFrMAg
 dEF9BADLwQBBZ4ET7bg2wwTf9djwaVzu3icree1eXZgM8WwAJdMTDY8j3w8L7PqowVkg
 OQL+nfYyhYhgohtg9wQBzshhraIg9tvoWWQ5lCBjXcotJW5xox0VUfVMYxuzYatujIVl
 5V92D5EqZOds/Q8RLBLDwsrHDzo1kLv+jUZaRZVl+nMeW7oSpVFkZgLMUa4yp2j00hbT
 keFw==
X-Gm-Message-State: AOAM531jzfEmGeptLDFVzgbpuy8nhtuwmgsiM6bU0sSGSbI+5wkR/3fP
 +GMeIZ67CrjxEwpX++mfdHM=
X-Google-Smtp-Source: ABdhPJwU1mWLXQUCBk/cr2I4/KV5sNA0QBX6NdJBSPel6aICLgwoK3n4c4u3DzEAz75RN+WAzRwu0Q==
X-Received: by 2002:aa7:c447:: with SMTP id n7mr1365222edr.171.1616445001869; 
 Mon, 22 Mar 2021 13:30:01 -0700 (PDT)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
 by smtp.gmail.com with ESMTPSA id x1sm10321496eji.8.2021.03.22.13.30.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 13:30:01 -0700 (PDT)
Date: Mon, 22 Mar 2021 21:29:58 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, Martin Sebor <msebor@gcc.gnu.org>,
 Ning Sun <ning.sun@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Kalle Valo <kvalo@codeaurora.org>, Simon Kelley <simon@thekelleys.org.uk>,
 James Smart <james.smart@broadcom.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Anders Larsen <al@alarsen.net>, Tejun Heo <tj@kernel.org>,
 Serge Hallyn <serge@hallyn.com>, Imre Deak <imre.deak@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 tboot-devel@lists.sourceforge.net, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-scsi@vger.kernel.org, cgroups@vger.kernel.org,
 linux-security-module@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Lu Baolu <baolu.lu@linux.intel.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH 02/11] x86: tboot: avoid Wstringop-overread-warning
Message-ID: <20210322202958.GA1955909@gmail.com>
References: <20210322160253.4032422-1-arnd@kernel.org>
 <20210322160253.4032422-3-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210322160253.4032422-3-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_203041_933323_666D970F 
X-CRM114-Status: GOOD (  29.64  )
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


* Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> gcc-11 warns about using string operations on pointers that are
> defined at compile time as offsets from a NULL pointer. Unfortunately
> that also happens on the result of fix_to_virt(), which is a
> compile-time constant for a constantn input:
> 
> arch/x86/kernel/tboot.c: In function 'tboot_probe':
> arch/x86/kernel/tboot.c:70:13: error: '__builtin_memcmp_eq' specified bound 16 exceeds source size 0 [-Werror=stringop-overread]
>    70 |         if (memcmp(&tboot_uuid, &tboot->uuid, sizeof(tboot->uuid))) {
>       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> I hope this can get addressed in gcc-11 before the release.
> 
> As a workaround, split up the tboot_probe() function in two halves
> to separate the pointer generation from the usage. This is a bit
> ugly, and hopefully gcc understands that the code is actually correct
> before it learns to peek into the noinline function.
> 
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99578
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/x86/kernel/tboot.c | 44 ++++++++++++++++++++++++-----------------
>  1 file changed, 26 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/x86/kernel/tboot.c b/arch/x86/kernel/tboot.c
> index 4c09ba110204..f9af561c3cd4 100644
> --- a/arch/x86/kernel/tboot.c
> +++ b/arch/x86/kernel/tboot.c
> @@ -49,6 +49,30 @@ bool tboot_enabled(void)
>  	return tboot != NULL;
>  }
>  
> +/* noinline to prevent gcc from warning about dereferencing constant fixaddr */
> +static noinline __init bool check_tboot_version(void)
> +{
> +	if (memcmp(&tboot_uuid, &tboot->uuid, sizeof(tboot->uuid))) {
> +		pr_warn("tboot at 0x%llx is invalid\n", boot_params.tboot_addr);
> +		return false;
> +	}
> +
> +	if (tboot->version < 5) {
> +		pr_warn("tboot version is invalid: %u\n", tboot->version);
> +		return false;
> +	}
> +
> +	pr_info("found shared page at phys addr 0x%llx:\n",
> +		boot_params.tboot_addr);
> +	pr_debug("version: %d\n", tboot->version);
> +	pr_debug("log_addr: 0x%08x\n", tboot->log_addr);
> +	pr_debug("shutdown_entry: 0x%x\n", tboot->shutdown_entry);
> +	pr_debug("tboot_base: 0x%08x\n", tboot->tboot_base);
> +	pr_debug("tboot_size: 0x%x\n", tboot->tboot_size);
> +
> +	return true;
> +}
> +
>  void __init tboot_probe(void)
>  {
>  	/* Look for valid page-aligned address for shared page. */
> @@ -66,25 +90,9 @@ void __init tboot_probe(void)
>  
>  	/* Map and check for tboot UUID. */
>  	set_fixmap(FIX_TBOOT_BASE, boot_params.tboot_addr);
> -	tboot = (struct tboot *)fix_to_virt(FIX_TBOOT_BASE);
> -	if (memcmp(&tboot_uuid, &tboot->uuid, sizeof(tboot->uuid))) {
> -		pr_warn("tboot at 0x%llx is invalid\n", boot_params.tboot_addr);
> +	tboot = (void *)fix_to_virt(FIX_TBOOT_BASE);
> +	if (!check_tboot_version())
>  		tboot = NULL;
> -		return;
> -	}
> -	if (tboot->version < 5) {
> -		pr_warn("tboot version is invalid: %u\n", tboot->version);
> -		tboot = NULL;
> -		return;
> -	}
> -
> -	pr_info("found shared page at phys addr 0x%llx:\n",
> -		boot_params.tboot_addr);
> -	pr_debug("version: %d\n", tboot->version);
> -	pr_debug("log_addr: 0x%08x\n", tboot->log_addr);
> -	pr_debug("shutdown_entry: 0x%x\n", tboot->shutdown_entry);
> -	pr_debug("tboot_base: 0x%08x\n", tboot->tboot_base);
> -	pr_debug("tboot_size: 0x%x\n", tboot->tboot_size);

This is indeed rather ugly - and the other patch that removes a debug 
check seems counterproductive as well.

Do we know how many genuine bugs -Wstringop-overread-warning has 
caught or is about to catch?

I.e. the real workaround might be to turn off the -Wstringop-overread-warning,
until GCC-11 gets fixed?

Thanks,

	Ingo

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
