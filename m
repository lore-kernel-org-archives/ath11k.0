Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498B6C5475B
	for <ath11k@archiver.kernel.org>; Fri,  1 Mar 2024 12:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n4vy0ssj1y9OKJx6whcKaZP2Wd8dgYFve24tfX8P7n0=; b=CECkYK2Yq/TuAc2+l/pBHKuTsS
	PM3KPkWjmYvWjoJdlmiur/xBGfeiS8/3OhHxLNwJJ1N+eXdFruzV/FtUyVaQ/ilnaMo62hK0eFS+x
	on8phHC5vINMUmJ6qe9muRqMbPio9lBzo9S3yt/tuHuvca9m0tAb5jHMWt1zCqmjQ2dCJ+kASewzY
	NetcWk5tRlC0AtX0pOV7phCuKleiXSy79m/Y/hXmux2+C4rjWiKHWSOrxN5QLR97pihVyAY9E2jOk
	2e/Ng9/p46+it2V38G4YrpF8J0EDb5SirL35ukaAyVakEg5TRcyOGhcLUdv9E26apebnQ8u5lxEa4
	YtoDUFjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg1xp-000000009ND-3T3D;
	Fri, 01 Mar 2024 12:26:09 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg1xn-000000009LS-2BMJ
	for ath11k@lists.infradead.org;
	Fri, 01 Mar 2024 12:26:09 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6e5b1c6daa3so740550b3a.1
        for <ath11k@lists.infradead.org>; Fri, 01 Mar 2024 04:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709295965; x=1709900765; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n4vy0ssj1y9OKJx6whcKaZP2Wd8dgYFve24tfX8P7n0=;
        b=vgdKBs0Wql+lU0308aYOG7AmGJwzcKkAGOY/JgxImkf/OnU7v0LzT/F+l7zHEogIrH
         bLBUsbbXX+v3A7VvdMeMFajptt3b574hDGzoT9DslwrqngdEzJJxQxs8MqTgKrqMG9nR
         6DkxE+FIXlE/fnNq6/Y+FB/XXTbVhNlC6nmfCCLZ5Xh3Z8mF57PCNS10XxPz36TGVL7y
         RN77Iicb1YLq0F3Rds09711s3MgiFm4o1AEAbbNv2vFe+QlnwNBZ4FRNMeADJAlOGuq7
         N5HcxIzg63C+4/S9FFm437HxcfOB6uhUV2k3luSwqN7MrzBgGRMEGtcj11rY9EsMHqXf
         Z9aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709295965; x=1709900765;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n4vy0ssj1y9OKJx6whcKaZP2Wd8dgYFve24tfX8P7n0=;
        b=FirpUWe1DafyHVHK3xzQwyf2G0V/7jTlF/cDyJd+2M0Pgv6yNYK/PuMMJ8uRWtod9y
         QLmcsggHPNgDl6ERuJMGfSnazKYmkRRrTHMhVV7IslT6m4pLzYQMsfiFStP5VJ7uA0Kj
         vnCH5U/EDpAPGxfIoIHbsbF+IrY/RGPe0cNU0ZWc2vB8nBK39skv82fk+cnbfWjInNw4
         xMxMbQGPtg8Idk1SySyoMz+uT6GNskWflKlsmh53xcEP2fA1//xG70Yry8PMRaFUpXwQ
         7v7xHRdGFIJTLHk4/6QXKsCeGqrxfTAGq7SCcFHGmrg5TrByilpPJlWdgQFDW7zMiiDM
         smgA==
X-Forwarded-Encrypted: i=1; AJvYcCWwIb2G3pZ7Hv0rj34YV0Q75M44+FRDhd4VdzuhUfOEMgsVwHf8JaLC2o9MCTmLc9XXHcC00+9sQD7kwV19C9+cmIi1RrqxfwqHkw==
X-Gm-Message-State: AOJu0Yxc0SWFezJsjqitd+e+J4t6pocIo3RJZ60FSXZe00/PydQrqZnk
	iTXACPFYkU0e6/wrzvJ8JoZfLfsTFSDs3CBPN33cHgKW8WM7CyHMl1Ows/mk7A==
X-Google-Smtp-Source: AGHT+IHDbZOb0MqU0lNgT6Ylu5XAVO9Rkznovko5WeZRWLmmdsVhJISyuzq0BMbPgmlDmT83+wLDug==
X-Received: by 2002:a05:6a20:4327:b0:1a0:6856:d12c with SMTP id h39-20020a056a20432700b001a06856d12cmr1584913pzk.18.1709295965331;
        Fri, 01 Mar 2024 04:26:05 -0800 (PST)
Received: from thinkpad ([2409:40f4:13:3cbc:2484:3780:dcff:ebcf])
        by smtp.gmail.com with ESMTPSA id p12-20020aa7860c000000b006e50e79f155sm2834437pfn.60.2024.03.01.04.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 04:26:04 -0800 (PST)
Date: Fri, 1 Mar 2024 17:55:59 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>,
	"Kalle Valo (QUIC)" <quic_kvalo@quicinc.com>,
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, netdev@vger.kernel.org
Subject: Re: [PATCH v4 1/3] bus: mhi: host: add mhi_power_down_keep_dev()
Message-ID: <20240301122559.GB2401@thinkpad>
References: <20240228022243.17762-1-quic_bqiang@quicinc.com>
 <20240228022243.17762-2-quic_bqiang@quicinc.com>
 <20240229101202.GB2999@thinkpad>
 <531daaa9-cf14-4812-8908-c617bd25bc08@quicinc.com>
 <87le7383nd.fsf@kernel.org>
 <b5b3f46d-ad98-44e5-84e0-7b00fe29ec5a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b5b3f46d-ad98-44e5-84e0-7b00fe29ec5a@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_042607_585885_003C60AB 
X-CRM114-Status: GOOD (  28.64  )
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

On Fri, Mar 01, 2024 at 10:04:06AM +0800, Baochen Qiang wrote:
> 
> 
> On 3/1/2024 3:35 AM, Kalle Valo wrote:
> > Baochen Qiang <quic_bqiang@quicinc.com> writes:
> > 
> > > On 2/29/2024 6:12 PM, Manivannan Sadhasivam wrote:
> > > > On Wed, Feb 28, 2024 at 10:22:41AM +0800, Baochen Qiang wrote:
> > > > > ath11k fails to resume:
> > > > > 
> > > > > ath11k_pci 0000:06:00.0: timeout while waiting for restart complete
> > > > > 
> > > > > This happens because when calling mhi_sync_power_up() the MHI subsystem
> > > > > eventually calls device_add() from mhi_create_devices() but the device
> > > > > creation is deferred:
> > > > > 
> > > > > mhi mhi0_IPCR: Driver qcom_mhi_qrtr force probe deferral
> > > > > 
> > > > > The reason for deferring device creation is explained in dpm_prepare():
> > > > > 
> > > > >           /*
> > > > >            * It is unsafe if probing of devices will happen during suspend or
> > > > >            * hibernation and system behavior will be unpredictable in this case.
> > > > >            * So, let's prohibit device's probing here and defer their probes
> > > > >            * instead. The normal behavior will be restored in dpm_complete().
> > > > >            */
> > > > > 
> > > > > Because the device probe is deferred, the qcom_mhi_qrtr_probe() is not
> > > > > called and thus MHI channels are not prepared:
> > > > > 
> > > > > So what this means that QRTR is not delivering messages and the QMI connection
> > > > > is not working between ath11k and the firmware, resulting a failure in firmware
> > > > > initialization.
> > > > > 
> > > > > To fix this add new function mhi_power_down_keep_dev() which doesn't destroy
> > > > > the devices for channels during power down. This way we avoid probe defer issue
> > > > > and finally can get ath11k hibernation working with the following patches.
> > > > > 
> > > > > Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> > > > > 
> > > > > Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> > > > 
> > > > Did Kalle co-author this patch? If so, his Co-developed-by tag should
> > > > be added.
> > > 
> > > Hmm, I'm not sure...  I would like Kalle's thoughts on this.
> > 
> > IIRC I did only some simple cleanup before submitting the patch so I
> > don't think Co-developed-by is justified. I'm also fine with removing my
> > Signed-off-by.
> Thanks Kalle.
> 
> Hi Mani, so according to Kalle's comments, I'd like to keep the patch as is.
> 

No. Either remove his signed off by (as indicated by Kalle) or add a
co-developed-by tag. Keeping just a signed-off-by tag is wrong.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

