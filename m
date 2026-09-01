Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF045C624D3
	for <ath11k@archiver.kernel.org>; Tue,  1 Sep 2026 14:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cMkyp7j0GDArFH/6epwRcq8HmCIf0xcPQczhEQvkqh8=; b=P1DvRuUsLv5Hig
	y+NCGzeoKJph1o5/3AnCRthlgDbhgliW/Qu/ZZ3urasl647JCpAUnQQYHy7y8OL1FFLh3sIxDrzo9
	dKHYF/Exa6RyLl/sCMDNDUoqEGNkQj5qXuWf7q3PWTz5MEhPDCsqBWb/XZAyZ/ALMw4mrVOYh33M6
	qlCIer4Pnbu/ser1S3ldOD7UM7tL3ln/XS7JEcSi9QWTP3XodqtfF8LL7n6rtUUvpgMpCd73IpFW4
	Te8dnRC3xUpotj7q5ANZ3Jzi5bf/Fche1iH9eujsA4WOCRZ6g2XYiUBv+J5k4bMKIt4gC8gMay7lf
	V7wxpNaXtGWafx4JOUAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Pk1-0000000CNaE-3YB2;
	Tue, 01 Sep 2026 14:45:37 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Pjz-0000000CNZG-06P7
	for ath11k@lists.infradead.org;
	Tue, 01 Sep 2026 14:45:36 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-47f96c5b722so3112484f8f.0
        for <ath11k@lists.infradead.org>; Tue, 01 Sep 2026 07:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788273932; x=1788878732; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:from:references:cc:to:subject:reply-to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cMkyp7j0GDArFH/6epwRcq8HmCIf0xcPQczhEQvkqh8=;
        b=P62hxk0mRdB+v0Uiq3c3j1Sj1TVpcEMwMlNv4xj/AfHLDwMN6A3i/c53+5ApOkqp+I
         VaH2yFcREq/GizDXLnHoCDtPvrTdlGU91ViUZZ+Gyu/sNLwUhzC8qdvtuTfRpks7jaeT
         /w5HzdGfNL0PywJVBxrkY37SS+qV1oo5I7igF+9n8ogA13J7XQ0qTB/mvVlot6tFc5n9
         t8Y5TvQQM6udzEZItm33F36cw9+LAK0cEy65KlznmjKUZSCzAFi9zkhMBLCgiaLZHFn3
         dyDwJ9yli53Yazjy0W/dArQXwmiyjdxVfitbvrbu0HwlVkD6jOFOTWLdSZTpWLXJhZjB
         wciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788273932; x=1788878732;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:from:references:cc:to:subject:reply-to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cMkyp7j0GDArFH/6epwRcq8HmCIf0xcPQczhEQvkqh8=;
        b=PqZ7sjzpw+IJygJH+P42C3wX/1BtOn+8DnPyKzVuAEDha1MQ51hgxPopdOfrGiQp56
         owd60KAjbOI95tTosxeUx/L5GTH9NJinq8Gx8H21KkLKKEeb8nDv42P9GeXZmLOD7+BA
         I6mbp1T9mpXPoKGGOwljDu8nnVtWjGafsOo8c8ZJOrMFtOXaM6nPukxk+TE+QC9qSlc2
         9ACqZyfrEcceQMleR/m8NcYis2s7ELX4c7bBAa7vGhWG3gQX27JEgubIPLOkK7sqnPPw
         8lyJB0SgmdlZd2Blw99izbcnXPxmekQiLbpqHjfRRww2uz73+ElYC9VGn31KhtxZZiU0
         ZKmg==
X-Forwarded-Encrypted: i=1; AKwUvBxT5WGXJ7TAXKVHYqYgqTaj8kXnsfmqQLyF1IpskvX9rHNxYpqSTjI5w9dh9cZftQZV8Lcqp1E=@lists.infradead.org
X-Gm-Message-State: AFuF++mweeNOLb+fJYUW4eMBOKpvzykci9PHbWdbsPEibchW2vUTppEg
	8jlC34xP3monsp4BvsXnS8QQfmJcrVpFwgoNziErEFMyM6YyLSLwOKpluy1cXVayNK3OwDbWAlu
	cX7KaDj8=
X-Gm-Gg: AYBFou2bDkXmGUbgvdDtRoXZvRXltXgtLJyP1m/0wgRWr/omptqvs3WFn8YQYd5jJXH
	zWwZk+r10p7wdjV6PsgxNpOid2qJzkJsYNQfzFRlCvuxp6ifd8L9gdPyU/QvkUcASNV/a3W5gRm
	g1lImlpMODxfofBkPvbmAvX4wJp0J9hrx16CoixKnjzaWET4TcJOD+KY8hF3ze4NTQ6Ml48RZ+P
	xcowAxS9OOdHi0Kr+TlaVF1PG04BWdDH8/onTZkTVIjo6Bk/GbIoGoqHwMSBgDInI5y95YOBST2
	zwmREACHfhLcovSzvVsNhmnhWF4VPrP4lgrqCXNlxz6yXLEGARlACF8LS5iVini3I175RNih3O1
	7/DoR3ARDY/blB8acEaz6PEK1r0O7yzCnqtwdGdrf1gu8SnPWRkLAOa7VecGb1tR+FjfIebgSsC
	z/id6SWw5Xj3ITL8OkaitlRV7kwVO9M7wwka2NDEHkKK9LSkaAL3gPaBt/o73kLTIt90SARhnHz
	2FAS10nJJBeLL4vwy2A5Xj6hDil1Gu8ExsFFLy4isU=
X-Received: by 2002:a05:6000:64a:b0:484:3621:6341 with SMTP id ffacd0b85a97d-48441011660mr15993949f8f.15.1788273932264;
        Tue, 01 Sep 2026 07:45:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:3b72:e9ec:2552:5b90? ([2a01:e0a:106d:1080:3b72:e9ec:2552:5b90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d37111sm5175659f8f.5.2026.09.01.07.45.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 07:45:31 -0700 (PDT)
Message-ID: <5b10cb13-77e6-4754-a885-92c873866ef4@linaro.org>
Date: Tue, 1 Sep 2026 16:45:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] wifi: ath11k: Add support for MHI bandwidth
 scaling
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jingoo Han <jingoohan1@gmail.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Manivannan Sadhasivam <mani@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 qiang.yu@oss.qualcomm.com, Miaoqing Pan <quic_miaoqing@quicinc.com>
References: <20260819-bwscale-v5-0-6dea79786b37@oss.qualcomm.com>
 <20260819-bwscale-v5-5-6dea79786b37@oss.qualcomm.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260819-bwscale-v5-5-6dea79786b37@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_074535_125025_5DBD7EA3 
X-CRM114-Status: GOOD (  22.94  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi,

On 8/19/26 15:25, Krishna Chaitanya Chundru wrote:
> From: Miaoqing Pan <quic_miaoqing@quicinc.com>
> 
> Add support for MHI bandwidth scaling, which will reduce power consumption
> if WLAN operates with lower bandwidth. This feature is only enabled for
> QCA6390.
> 
> Bandwidth scaling is initiated by the endpoint firmware based upon the
> bandwidth requirements, if there is high bandwidth data endpoint requests
> for higher data rates or if there is less bandwidth they request for lower
> data rates to reduce power. Endpoint initiates this through MHI protocol.
> 
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04546-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1

Somehow unrelated, but I added this to the ath12k to test on an WCN785x and I just
got a single event to set the speed to 5GT/s and no further event whatever the state
of the Wireless link is.

Is there anything required on the ath12k side to allow lowering the speed to 2.5GT/s ?

Thanks,
Neil

> 
> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath11k/mhi.c | 38 +++++++++++++++++++++++++++++++++++
>   1 file changed, 38 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
> index a6c9ff112c68..9bff4c4bca3b 100644
> --- a/drivers/net/wireless/ath/ath11k/mhi.c
> +++ b/drivers/net/wireless/ath/ath11k/mhi.c
> @@ -20,6 +20,7 @@
>   #define MHI_TIMEOUT_DEFAULT_MS	20000
>   #define RDDM_DUMP_SIZE	0x420000
>   #define MHI_CB_INVALID	0xff
> +#define MHI_BW_SCALE_CHAN_DB 126
>   
>   static const struct mhi_channel_config ath11k_mhi_channels_qca6390[] = {
>   	{
> @@ -71,6 +72,17 @@ static struct mhi_event_config ath11k_mhi_events_qca6390[] = {
>   		.client_managed = false,
>   		.offload_channel = false,
>   	},
> +	{
> +		.num_elements = 8,
> +		.irq_moderation_ms = 0,
> +		.irq = 1,
> +		.mode = MHI_DB_BRST_DISABLE,
> +		.data_type = MHI_ER_BW_SCALE,
> +		.priority = 2,
> +		.hardware_event = false,
> +		.client_managed = false,
> +		.offload_channel = false,
> +	},
>   };
>   
>   static const struct mhi_controller_config ath11k_mhi_config_qca6390 = {
> @@ -311,6 +323,30 @@ static void ath11k_mhi_op_write_reg(struct mhi_controller *mhi_cntrl,
>   	writel(val, addr);
>   }
>   
> +static int ath11k_mhi_op_get_misc_doorbell(struct mhi_controller *mhi_cntrl,
> +					   enum mhi_er_data_type type)
> +{
> +	if (type == MHI_ER_BW_SCALE)
> +		return MHI_BW_SCALE_CHAN_DB;
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static int ath11k_mhi_op_bw_scale(struct mhi_controller *mhi_cntrl,
> +				  struct mhi_link_info *link_info)
> +{
> +	enum pci_bus_speed speed = pci_lnkctl2_bus_speed(link_info->target_link_speed);
> +	struct ath11k_base *ab = dev_get_drvdata(mhi_cntrl->cntrl_dev);
> +	struct pci_dev *pci_dev = to_pci_dev(ab->dev);
> +	struct pci_dev *pdev;
> +
> +	pdev = pci_upstream_bridge(pci_dev);
> +	if (!pdev)
> +		return -ENODEV;
> +
> +	return pcie_set_target_speed(pdev, speed, true);
> +}
> +
>   static int ath11k_mhi_read_addr_from_dt(struct mhi_controller *mhi_ctrl)
>   {
>   	struct device_node *np;
> @@ -387,6 +423,8 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
>   	mhi_ctrl->status_cb = ath11k_mhi_op_status_cb;
>   	mhi_ctrl->read_reg = ath11k_mhi_op_read_reg;
>   	mhi_ctrl->write_reg = ath11k_mhi_op_write_reg;
> +	mhi_ctrl->bw_scale = ath11k_mhi_op_bw_scale;
> +	mhi_ctrl->get_misc_doorbell = ath11k_mhi_op_get_misc_doorbell;
>   
>   	switch (ab->hw_rev) {
>   	case ATH11K_HW_QCN9074_HW10:
> 


