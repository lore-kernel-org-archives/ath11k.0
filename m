Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A2BCD3424
	for <ath11k@archiver.kernel.org>; Wed,  6 May 2026 06:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YeddDN/7F4d5Y5O9u+ksHzBhx/JshclNIDmnp14S2mc=; b=jW7ZDd4kowwsK28re8njnTZ7BA
	wfj+vcDcVI36G8k+Va2RQVW3/vGoL55RDKVr2hUtmgEpqFsdOEsTGN9cUFD/rvTivbMupNFvlSCWX
	WfJtjUyheKI6paX5iebJrQeRgby9rRfMBRHA2ZZidMREj0WHoX095Ultu2GxlxC+IHxzSl8j4iKIK
	PwSVi6FSAP23uwoGChJ+U2rAZfhGm4MQhyNJ0yrN4zmKWpkevAyXholTloR6OFuw036rhwEA91gA9
	XrU6HdwNelSah6ocmZl1hVLwUk7wEDf9KKZ0AEQyFYd4AfsAsiAULt6rESdmobkfvxyn+qqrBIF9J
	as99qkhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKVdg-00000000si9-2MKY;
	Wed, 06 May 2026 06:21:44 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKVdd-00000000shK-3TQC
	for ath11k@lists.infradead.org;
	Wed, 06 May 2026 06:21:43 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso70831135e9.3
        for <ath11k@lists.infradead.org>; Tue, 05 May 2026 23:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778048499; x=1778653299; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YeddDN/7F4d5Y5O9u+ksHzBhx/JshclNIDmnp14S2mc=;
        b=PdDJ/zVop7Ds2Ktoqg1XtMbRqjkLVe2e26xqpIxxZG3JkF7IOZdsaDKghqGA8GlGdA
         E002AaVT8Rwxw+RKuEhtjFDjnjxJ8xrHReN/tSHMSaXkc/RxGjLvhl+dKUACoEYq85LG
         flyCcc5wDEh+aomM0E87bW+agb1GuConRN1XoqLcoPhjbbbt1+bVaZbYDtlz1dx5aC6m
         7Eh35mxEMYfQRcujscSwyoT0K8YN0workgx+w4vYMlwVU+JOChCbInL+0s5yaMKTXtUS
         Vw54Dc9ZAI0sIk7T0E5LqAmYZFPx9fwkzsBK1WT0YxZ5WN/ZDcv3Q2E+DyPiFfGqEai+
         GO1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778048499; x=1778653299;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YeddDN/7F4d5Y5O9u+ksHzBhx/JshclNIDmnp14S2mc=;
        b=kgomZ6abVGwWmngNvNbGlJrdAwVTgjrYt9cjV9b4t0VS1pX7pN8+oAWZLeSKjAQ91P
         pcGQYFSZTKPwFv4QBsGyO05BTE6IWq5bC/hHfjCuXZuSdaEqu390YFsu0awHkn7/2LUu
         wWD2iBUO4PPNKdObD2Duie9tQCBiJi37l/FuyQaR60Pe0HUTprGvysC1qoL69l0L5lTT
         a0AjcM/xF8WwsGaWbUnLpEBHcfrIpsJpbijWZOu/OhfgqMMJsrmLWsLiuOlGhusfBvwP
         tosZKBj8rW7riaw0GyZVxw0SNQE3UVWbGS6pFOhwtL+95eCo4I5Bs0Q+DkkFpBrCyN8o
         foOg==
X-Forwarded-Encrypted: i=1; AFNElJ88Q988Mt3g0X61MPvs0A/IKhQmjM8tktnTOm90P4XCA92qORE2pqZtg28Rn9yhnjir4d4zhj0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyVmXMmGepghifQKnHpyLrlpNHkzGZh9KSLrWWyhiELlfkEH8LN
	+sZq2mygpn2tD5yOSYaK4g5HhknQMMvhgDYxTSq4GEHdv1eQQC476LM0
X-Gm-Gg: AeBDievBxUHkVr3uLmYNViOetRm2QM42xuhJ+gZ9DJVco6qKpxAf6hAqc+mSCRDr/t5
	7DMyQhueG2jp95CNQcprmT4+AznqolQuYeINhk64sGh69PXtKTnE30xCayxo+zdreNueEt67dOY
	iRolyU1oFMq0RX7Af8WNFnabcxx7F4gWD302CUeczYNxTohTDeqYCUo/k4eI4+TBEYM4jtBvQGF
	UpZWdwWKHEuHdk67V3rqtatSx9pjki80SGdQH17Y7LfY+hfHGB5bN2RrgUwtcIKfOtnrkghhpJe
	da6No70L7x5PCUIohFOBD1nwKJnhabfX0F71Wx+HgS/Ojk3X3k/5yHK5KXmNn6Ayih0obHiEgiK
	Re38X3SAIO4Hi4u4p/jtG7EE3Z0DOwUWNMEuRBJVkR8d1Wr4Z3Fn4lnzUwN+CLLnEM5ZOQilJ96
	qzZs2M64tUDxaZoFsxnM/eK9IHbelw/MSt3OR+hG58wHwq9PySx8Pv
X-Received: by 2002:a05:600c:2d16:b0:48a:72ab:f88c with SMTP id 5b1f17b1804b1-48e52be1069mr12666785e9.17.1778048498987;
        Tue, 05 May 2026 23:21:38 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530b2947sm9010655e9.4.2026.05.05.23.21.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 23:21:38 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 06 May 2026 08:21:38 +0200
Message-Id: <DIBDL7QAG5YF.3JNT6EYASRT7W@gmail.com>
Cc: <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 2/2] wifi: ath11k: fix error path leaks in some WMI
 calls
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Rameshkumar Sundaram" <rameshkumar.sundaram@oss.qualcomm.com>, "Nicolas
 Escande" <nico.escande@gmail.com>, <ath11k@lists.infradead.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260502071453.2379188-1-nico.escande@gmail.com>
 <20260502071453.2379188-3-nico.escande@gmail.com>
 <151425e9-564d-4d61-b37d-3eef9bc54b6f@oss.qualcomm.com>
In-Reply-To: <151425e9-564d-4d61-b37d-3eef9bc54b6f@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_232141_889843_48411E72 
X-CRM114-Status: GOOD (  16.49  )
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

On Tue May 5, 2026 at 7:23 PM CEST, Rameshkumar Sundaram wrote:
> On 5/2/2026 12:44 PM, Nicolas Escande wrote:
>> This is the same pattern that was previously identified as problematic:
>> direct 'return ath11k_wmi_cmd_send(...)' will leak the skb in the error
>> path if it is not explicitly handled.
>>=20
>> Fixes: c417b247ba04 ("ath11k: implement hardware data filter")
>> Fixes: 9cbd7fc9be82 ("ath11k: support MAC address randomization in scan"=
)
>> Fixes: ba9177fcef21 ("ath11k: Add basic WoW functionalities")
>> Fixes: fec4b898f369 ("ath11k: Add WoW net-detect functionality")
>> Fixes: c3c36bfe998b ("ath11k: support ARP and NS offload")
>> Fixes: a16d9b50cfba ("ath11k: support GTK rekey offload")
>> Fixes: 652f69ed9c1b ("ath11k: Add support for SAR")
>> Fixes: 0f84a156aa3b ("ath11k: Handle keepalive during WoWLAN suspend and=
 resume")
>> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
>> ---
>>   drivers/net/wireless/ath/ath11k/wmi.c | 112 ++++++++++++++++++++++----
>>   1 file changed, 96 insertions(+), 16 deletions(-)
>>=20
>> diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireles=
s/ath/ath11k/wmi.c
>> index 024c2aad9fb4..dca6e011cc40 100644
>> --- a/drivers/net/wireless/ath/ath11k/wmi.c
>> +++ b/drivers/net/wireless/ath/ath11k/wmi.c
>> @@ -9299,7 +9299,7 @@ int ath11k_wmi_hw_data_filter_cmd(struct ath11k *a=
r, u32 vdev_id,
>>   {
>>   	struct wmi_hw_data_filter_cmd *cmd;
>>   	struct sk_buff *skb;
>> -	int len;
>> +	int ret, len;
>>  =20
>>   	len =3D sizeof(*cmd);
>>   	skb =3D ath11k_wmi_alloc_skb(ar->wmi->wmi_ab, len);
>> @@ -9324,7 +9324,13 @@ int ath11k_wmi_hw_data_filter_cmd(struct ath11k *=
ar, u32 vdev_id,
>>   		   "hw data filter enable %d filter_bitmap 0x%x\n",
>>   		   enable, filter_bitmap);
>>  =20
>> -	return ath11k_wmi_cmd_send(ar->wmi, skb, WMI_HW_DATA_FILTER_CMDID);
>> +	ret =3D ath11k_wmi_cmd_send(ar->wmi, skb, WMI_HW_DATA_FILTER_CMDID);
>> +	if (ret) {
>> +		ath11k_warn(ar->ab, "failed to send WMI_HW_DATA_FILTER_CMDID\n");
>> +		dev_kfree_skb(skb);
>> +	}
>> +
>> +	return ret;
>>   }
>>
>
> { .. }
>
>
>> @@ -10053,7 +10127,13 @@ int ath11k_wmi_sta_keepalive(struct ath11k *ar,
>>   		   "sta keepalive vdev %d enabled %d method %d interval %d\n",
>>   		   arg->vdev_id, arg->enabled, arg->method, arg->interval);
>>  =20
>> -	return ath11k_wmi_cmd_send(wmi, skb, WMI_STA_KEEPALIVE_CMDID);
>> +	ret =3D ath11k_wmi_cmd_send(wmi, skb, WMI_STA_KEEPALIVE_CMDID);
>> +	if (ret) {
>> +		ath11k_warn(ar->ab, "failed to send WMI_STA_KEEPALIVE_CMDID\n");
>> +		dev_kfree_skb(skb);
>> +	}
>> +
>> +	return ret;
>>   }
>>  =20
>>   bool ath11k_wmi_supports_6ghz_cc_ext(struct ath11k *ar)
>
>
> Thanks for fixing these. One more instance of the same pattern remains=20
> in ath11k_tm_cmd_wmi_ftm().
>
Ha nice catch, I originally skipped it because I saw there was a 'if (ret)'=
 and
assumed it had the proper error handling.

> Please add dev_kfree_skb(skb) before goto out, matching=20
> ath11k_tm_cmd_wmi() above.
Yes seems it needs it's own patch and fixes tag. I'll respin the series the=
n.

Thanks

